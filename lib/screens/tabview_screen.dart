import 'package:bloc_reso_coder/screens/exchanges_screen.dart';
import 'package:flutter/material.dart';

import 'crypto_screen.dart';

class TabViewScreen extends StatelessWidget {
  const TabViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Text(
            'Welcome to Crypto App',
            style: TextStyle(color: Colors.white70),
          ),
          bottom: const TabBar(
            labelColor: Colors.white70,
            indicatorColor: Colors.white70,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.currency_bitcoin,
                  color: Colors.white70,
                ),
                text: 'Crypto',
              ),
              Tab(
                icon: Icon(
                  Icons.currency_exchange_sharp,
                  color: Colors.white70,
                ),
                text: 'Exchange',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: CryptoScreen(),
            ),
            Center(
              child: ExchangesScreen(),
            )
          ],
        ),
      ),
    );
  }
}
