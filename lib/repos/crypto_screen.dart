import 'package:bloc_reso_coder/repos/coin_screen.dart';
import 'package:bloc_reso_coder/repos/crypto_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_states_bloc/crypto_bloc/crypto_bloc.dart';
import '../models/crypto_model.dart';

class CryptoScreen extends StatelessWidget {
  const CryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CryptoBloc(RepositoryProvider.of<CryptoRepository>(context))
            ..add(LoadCryptoEvent()),
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Text(
            'The BLoC App',
            style: TextStyle(color: Colors.white70),
          ),
        ),
        body: BlocBuilder<CryptoBloc, CryptoState>(builder: (context, state) {
          if (state is CryptoLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CryptoLoadedState) {
            List<CryptoModel> cryptoList = state.cryptos;
            return ListView.builder(
              itemCount: cryptoList.length,
              itemBuilder: (_, index) {
                return Card(
                  color: Colors.black54,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoinScreen(
                                    coinId: cryptoList[index].id,
                                  )));
                    },
                    title: Text(
                      cryptoList[index].id.toString(),
                      style: const TextStyle(color: Colors.white70),
                    ),
                    subtitle: Text(
                      cryptoList[index].name.toString(),
                      style: const TextStyle(color: Colors.white70),
                    ),
                    trailing: CircleAvatar(
                      backgroundImage: NetworkImage(cryptoList[index].symbol),
                    ),
                  ),
                );
              },
            );
          } else if (state is CryptoErrorState) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const Text('greska');
        }),
      ),
    );
  }
}
