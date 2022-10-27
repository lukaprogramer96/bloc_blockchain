// ignore_for_file: must_be_immutable

import 'package:bloc_reso_coder/repos/crypto_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/coin_bloc/coin_bloc.dart';

class CoinScreen extends StatelessWidget {
  CoinScreen({super.key, required this.coinId});
  String coinId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CoinBloc(RepositoryProvider.of<CryptoRepository>(context))
            ..add(
              GetCoinEvent(id: coinId),
            ),
      child: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          if (state is CoinLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CoinLoadedState) {
            return state.coin != null
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  state.coin!.rank != null
                                      ? '${state.coin!.rank}.'
                                      : '0',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                      color: Colors.white70),
                                ),
                                Text(
                                  state.coin!.name != null
                                      ? state.coin!.name!
                                      : 'Coin has no name',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                      color: Colors.white70),
                                ),
                              ],
                            ),
                            Text(
                              state.coin!.isActive != null &&
                                      state.coin!.isActive!
                                  ? 'not active active'
                                  : 'active',
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          state.coin!.description != null
                              ? state.coin!.description!
                              : 'No description',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Tags',
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          )
                        ],
                      )
                    ],
                  )
                : const Center(
                    child: Text('No coin'),
                  );
          }
          return Container();
        },
      ),
    );
  }
}
