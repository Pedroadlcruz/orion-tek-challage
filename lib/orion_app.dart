import 'package:flutter/material.dart';
import 'package:orion_tek_challenge/core/router/app_router.dart';

import 'core/constants/strings.dart';

class OrionApp extends StatelessWidget {
  const OrionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
