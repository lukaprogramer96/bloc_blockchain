part of 'coin_bloc.dart';

abstract class CoinEvent extends Equatable {
  const CoinEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinEvent extends CoinEvent {}

class GetCoinEvent extends CoinEvent {
  @override
  List<Object> get props => [id];

  final String id;
  const GetCoinEvent({
    required this.id,
  });
}
