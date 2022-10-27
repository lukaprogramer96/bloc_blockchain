part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object> get props => [];
}

class CryptoLoadingState extends CryptoState {
  @override
  List<Object> get props => [];
}

class CryptoLoadedState extends CryptoState {
  const CryptoLoadedState(this.cryptos);
  final List<CryptoModel> cryptos;

  @override
  List<Object> get props => [cryptos];
}

class CryptoErrorState extends CryptoState {
  const CryptoErrorState(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
