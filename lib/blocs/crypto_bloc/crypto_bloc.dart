// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:bloc_reso_coder/models/crypto_model/crypto_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/crypto_repository.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CryptoLoadingState()) {
    on<LoadCryptoEvent>((event, emit) async {
      emit(CryptoLoadingState());
      try {
        final cryptos = await CryptoRepository.getCryptos();
        emit(CryptoLoadedState(cryptos ?? []));
      } catch (e) {
        emit(CryptoErrorState(e.toString()));
      }
    });
  }
}
