import 'package:equatable/equatable.dart';

abstract class ExchangesEvent extends Equatable {
  const ExchangesEvent();

  @override
  List<Object> get props => [];
}

class LoadExchangesEvent extends ExchangesEvent {}
