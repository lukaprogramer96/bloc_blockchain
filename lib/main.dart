import 'package:bloc_reso_coder/repos/crypto_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/pagination_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              CryptoRepository(), //napraviti da mogu da pozovem vise repo-a (UserRepository)
        ),
        RepositoryProvider(
          create: (context) => CryptoRepository(),
        ),
      ],
      child: const MaterialApp(
        // home: CryptoScreen(),
        // home: ExchangesScreen(),
        // home: TabViewScreen(),
        // home: TabViewOptionsScreen(
        //   coinId: 1.toString(),
        // ),
        home: PaginationScreen(),
      ),
    );
  }
}
