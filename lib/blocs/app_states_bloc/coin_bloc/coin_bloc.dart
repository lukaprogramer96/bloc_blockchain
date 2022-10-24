// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/coin_model.dart';
import '../../../repos/crypto_repository.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CryptoRepository _coinRepository;

  CoinBloc(this._coinRepository) : super(CoinLoadingState()) {
    on<GetCoinEvent>((event, emit) async {
      emit(CoinLoadingState());
      try {
        final coin = await _coinRepository.getCoin(event.id);
        emit(CoinLoadedState(coin));
      } catch (e) {
        emit(CoinErrorState(e.toString()));
      }
    });
  }
}
