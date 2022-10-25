// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/twitter_model.dart';
import '../../repos/crypto_repository.dart';

part 'twitter_event.dart';
part 'twitter_state.dart';

class TwitterBloc extends Bloc<TwitterEvent, TwitterState> {
  final CryptoRepository _coinRepository;

  TwitterBloc(
    this._coinRepository,
  ) : super(TwitterLoadingState()) {
    on<GetTwitterDataEvent>((event, emit) async {
      emit(TwitterLoadingState());
      try {
        final twitterList =
            await _coinRepository.getTwitterByCoinId(event.twitterCoinId);
        emit(TwitterLoadedState(twitterList));
      } catch (e) {
        emit(TwitterErrorState(e.toString()));
      }
    });
  }
}
