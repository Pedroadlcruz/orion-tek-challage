import 'package:flutter/material.dart';
import 'package:orion_tek_challenge/orion_app.dart';
import 'package:orion_tek_challenge/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  runApp(const OrionApp());
}
