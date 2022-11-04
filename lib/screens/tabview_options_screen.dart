import 'package:flutter/material.dart';

class TabViewOptionsScreen extends StatelessWidget {
  const TabViewOptionsScreen({super.key, required String coinId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Options Screen'),
      ),
      body: const Center(
        child: Text('Coin Details Screen'),
      ),
    );
  }
}
