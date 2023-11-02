import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';
import 'package:orion_tek_challenge/presentation/blocs/add_address/add_address_bloc.dart';
import 'package:orion_tek_challenge/presentation/blocs/add_client/add_client_bloc.dart';
import 'package:orion_tek_challenge/presentation/blocs/add_company_bloc/add_company_bloc.dart';
import 'package:orion_tek_challenge/presentation/blocs/company_detail/company_detail_bloc.dart';
import 'package:orion_tek_challenge/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:orion_tek_challenge/presentation/screens/add_client_screen.dart';
import 'package:orion_tek_challenge/presentation/screens/add_company_screen.dart';
import 'package:orion_tek_challenge/presentation/screens/company_detail_screen.dart';
import 'package:orion_tek_challenge/service_locator.dart';

import '../../presentation/blocs/client_detail/client_detail_bloc.dart';
import '../../presentation/screens/add_address_screen.dart';
import '../../presentation/screens/client_detail_screen.dart';
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
      case CompanyDetailScreen.routeName:
        final company = settings.arguments as Company;
        return _buildPage(BlocProvider.value(
          value: sl<CompanyDetailBloc>()..add(LoadClients(company.id)),
          child: CompanyDetailScreen(company: company),
        ));
      case AddClientScreen.routeName:
        final company = settings.arguments as Company;
        return _buildPage(BlocProvider.value(
          value: sl<AddClientBloc>(),
          child: AddClientScreen(company: company),
        ));
      case ClientDetailScreen.routeName:
        final client = settings.arguments as Client;
        return _buildPage(BlocProvider.value(
          value: sl<ClientDetailBloc>()..add(LoadAddresses(client.id)),
          child: ClientDetailScreen(client: client),
        ));
      //AddAddressScreen
      case AddAddressScreen.routeName:
        final client = settings.arguments as Client;
        return _buildPage(BlocProvider.value(
          value: sl<AddAddressBloc>(),
          child: AddAddressScreen(client: client),
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
