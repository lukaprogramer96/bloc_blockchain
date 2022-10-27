// ignore_for_file: depend_on_referenced_packages, annotate_overrides

import 'package:bloc/bloc.dart';

import '../../repos/crypto_repository.dart';
import 'exchange_event.dart';
import 'exchanges_state.dart';

class ExchangesBloc extends Bloc<ExchangesEvent, ExchangesState> {
  final CryptoRepository _cryptoRepository;

  ExchangesBloc(this._cryptoRepository) : super(const ExchangesInitial()) {
    on<LoadExchangesEvent>((event, emit) async {
      emit(ExchangesLoadingState());
      try {
        final exchanges = await _cryptoRepository.getExchanges();
        emit(ExchangesLoadedState(exchanges));
      } catch (e) {
        emit(ExchangesErrorState(e.toString()));
      }
    });
  }
}
