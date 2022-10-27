import 'package:bloc_reso_coder/screens/twitter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/options_bloc/options_bloc.dart';
import 'coin_screen.dart';

// ignore: must_be_immutable
class OptionsScreen extends StatelessWidget {
  OptionsScreen({super.key, required this.coinId});
  String coinId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text(
          'Options',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Colors.black54,
      ),
      body: BlocProvider(
        create: ((context) => OptionsBloc()..add(LoadOptionsEvent())),
        child:
            BlocBuilder<OptionsBloc, OptionsState>(builder: (ctxbloc, state) {
          if (state is OptionsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is OptionsLoadedState) {
            return Column(
              children: [
                Expanded(
                  child: CoinScreen(coinId: coinId),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          textStyle: const TextStyle(
                              fontSize: 20, color: Colors.black54),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Coin Details',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          BlocProvider.of<OptionsBloc>(ctxbloc).add(
                              const TwitterEvent()); //treba da mu kazem koji je stejt po tom eventu
                        },
                        child: const Text(
                          'Twitter',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          if (state is OptionsLoadedTwitterState) {
            return Column(
              children: [
                Expanded(
                  child: TwitterScreen(twitterCoinId: coinId),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          textStyle: const TextStyle(
                              fontSize: 20, color: Colors.black54),
                        ),
                        onPressed: () {
                          BlocProvider.of<OptionsBloc>(ctxbloc)
                              .add(LoadOptionsEvent());
                        },
                        child: const Text(
                          'Coin Details',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          BlocProvider.of<OptionsBloc>(ctxbloc).add(
                              const TwitterEvent()); //treba da mu kazem koji je stejt po tom eventu
                        },
                        child: const Text(
                          'Twitter',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          return const Center(
            child: Text(
              'Error',
              style: TextStyle(color: Colors.white),
            ),
          );
        }),
      ),
    );
  }
}
