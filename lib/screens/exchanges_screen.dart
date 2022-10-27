import 'package:bloc_reso_coder/repos/crypto_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/exchanges_bloc/exchange_event.dart';
import '../blocs/exchanges_bloc/exchanges_bloc.dart';
import '../blocs/exchanges_bloc/exchanges_state.dart';
import '../models/exchanges_model/exchanges_model.dart';

class ExchangesScreen extends StatelessWidget {
  const ExchangesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExchangesBloc(RepositoryProvider.of<CryptoRepository>(context))
            ..add(LoadExchangesEvent()),
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: BlocBuilder<ExchangesBloc, ExchangesState>(
            builder: (context, exchangesState) {
          if (exchangesState is ExchangesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (exchangesState is ExchangesLoadedState) {
            List<ExchangesModel> exchangesList = exchangesState.exchanges;
            return ListView.builder(
              itemCount: exchangesList.length,
              itemBuilder: (_, index) {
                return Card(
                  color: Colors.black54,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    onTap: () {},
                    title: Row(
                      children: [
                        Text(
                          exchangesList[index].name.toString(),
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (exchangesState is ExchangesErrorState) {
            return const Center(
              child: Text(
                'Error',
                style: TextStyle(color: Colors.pink, fontSize: 35),
              ),
            );
          }
          return const Text(
            'greska',
            style: TextStyle(color: Colors.pink),
          );
        }),
      ),
    );
  }
}
