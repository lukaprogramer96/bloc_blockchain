// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/coin_model/coin_model.dart';
import '../../data/repository/crypto_repository.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc() : super(CoinLoadingState()) {
    on<GetCoinEvent>((event, emit) async {
      emit(CoinLoadingState());
      try {
        final coin = await CryptoRepository.getCoin(event.id);
        emit(CoinLoadedState(coin));
      } catch (e) {
        emit(CoinErrorState(e.toString()));
      }
    });
  }
}

//final cryptos = await CryptoRepository.getCryptos();
  //      emit(CryptoLoadedState(cryptos ?? []));
