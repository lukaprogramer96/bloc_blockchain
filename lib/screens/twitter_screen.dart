// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:bloc_reso_coder/repos/crypto_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/twitter_bloc/twitter_bloc.dart';
import '../models/twitter_model/twitter_model.dart';

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
            List<TwitterModel>? twitterList = state.twitterList;
            return state.twitterList != null
                ? ListView.builder(
                    itemCount: twitterList?.length,
                    itemBuilder: (_, index) {
                      return Card(
                        color: Colors.black54,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              twitterList![index].username ?? 'no username',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              twitterList[index].status ?? 'no status',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            // Text(
                            //   twitterList[index].retweetcount ?? 'no retweets',
                            //   style: const TextStyle(
                            //     color: Colors.white,
                            //   ),
                            // ),
                            // Text(
                            //   twitterList[index].likecount ?? 'no likes',
                            //   style: const TextStyle(
                            //     color: Colors.white,
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    })
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
