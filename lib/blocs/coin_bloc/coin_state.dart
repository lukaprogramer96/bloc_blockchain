part of 'coin_bloc.dart';

abstract class CoinState extends Equatable {
  const CoinState();

  @override
  List<Object> get props => [];
}

class CoinLoadingState extends CoinState {}

class CoinLoadedState extends CoinState {
  const CoinLoadedState(this.coin);
  final CoinModel? coin;
}

class CoinErrorState extends CoinState {
  const CoinErrorState(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

class CoinStateDetails extends CoinState {
  const CoinStateDetails(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
