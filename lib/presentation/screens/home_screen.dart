import 'package:flutter/material.dart';
import 'package:orion_tek_challenge/core/constants/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text(Strings.appName)),
    );
  }
}
