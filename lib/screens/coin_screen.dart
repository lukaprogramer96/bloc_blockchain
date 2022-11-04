// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/coin_bloc/coin_bloc.dart';

class CoinScreen extends StatelessWidget {
  CoinScreen({super.key, required this.coinId});
  String coinId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinBloc()
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
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Tags',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25),
                              ),
                            ),
                          ),
                          // Row(
                          //   children: state.coin!.tags != null
                          //       ? state.coin!.tags!
                          //           .map(
                          //             (e) => Text(e.name),
                          //           )
                          //           .toList()
                          //       : [],
                          // ),
                          GridView.count(
                            mainAxisSpacing: 0,
                            childAspectRatio: 1 / 0.51,
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            children: state.coin!.tags != null
                                ? state.coin!.tags!
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Card(
                                                margin: const EdgeInsets.all(1),
                                                color: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: Colors.green),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Text(
                                                        e.name,
                                                        style: const TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 15),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList()
                                : [],
                          ),
                        ],
                      )
                    ],
                  )
                : const Center(
                    child: Text(
                      'No coin',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
          }
          return Container(
            color: Colors.blue,
            width: 100,
          );
        },
      ),
    );
  }
}
