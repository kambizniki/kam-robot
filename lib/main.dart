import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const KamRobotApp());
}

class KamRobotApp extends StatelessWidget {
  const KamRobotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kam Robot',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.green,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
