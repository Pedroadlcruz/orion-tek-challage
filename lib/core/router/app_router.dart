import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/presentation/blocs/add_company_bloc/add_company_bloc.dart';
import 'package:orion_tek_challenge/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:orion_tek_challenge/presentation/screens/add_company_screen.dart';
import 'package:orion_tek_challenge/service_locator.dart';

import '../../presentation/screens/home_screen.dart';

class AppRouter {
  ///
  /// Given a [route name]...
  ///Build a route base on the current Platform [IOS] and [Android]
  ///
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return _buildPage(BlocProvider.value(
          value: sl<HomeBloc>()..add(const LoadCompanies()),
          child: const HomeScreen(),
        ));
      case AddCompanyScreen.routeName:
        return _buildPage(BlocProvider.value(
          value: sl<AddCompanyBloc>(),
          child: const AddCompanyScreen(),
        ));
      default:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

//Build a route base on the current Platform [IOS] and [Android]
  static Route<dynamic> _buildPage(
    Widget page, {
    String? routeName,
    Object? arguments,
  }) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        builder: (_) => page,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
    } else {
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
    }
  }
}
