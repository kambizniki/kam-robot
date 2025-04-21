import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kam Robot'),
      ),
      body: const Center(
        child: Text(
          'خوش آمدید به Kam Robot!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
