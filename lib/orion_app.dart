import 'package:flutter/material.dart';

class OrionApp extends StatelessWidget {
  const OrionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Orion App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text('Orion App')),
      ),
    );
  }
}
