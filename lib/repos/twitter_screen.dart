// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:bloc_reso_coder/repos/crypto_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/twitter_bloc.dart';

class TwitterScreen extends StatelessWidget {
  TwitterScreen({super.key, required this.twitterCoinId});
  String twitterCoinId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TwitterBloc(RepositoryProvider.of<CryptoRepository>(context))
            ..add(
              GetTwitterDataEvent(twitterCoinId: twitterCoinId),
            ),
      child: BlocBuilder<TwitterBloc, TwitterState>(
        builder: (context, state) {
          if (state is TwitterLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TwitterLoadedState) {
            return state.twitterList != null
                ? Container(
                    child: TwitterScreen(twitterCoinId: twitterCoinId),
                  )
                : Container(
                    child: Text('error'),
                  );
          }
          return Container();
        },
      ),
    );
  }
}
