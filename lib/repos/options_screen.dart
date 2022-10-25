import 'package:bloc_reso_coder/blocs/bloc/twitter_bloc.dart';
import 'package:bloc_reso_coder/repos/coin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/options_bloc.dart';

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
        child: BlocBuilder<OptionsBloc, OptionsState>(
          builder: (context, state) {
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
                          onPressed: null,
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
                            state is TwitterLoadedState;
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
          },
        ),
      ),
    );
  }
}
