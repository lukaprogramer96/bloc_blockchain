import 'package:equatable/equatable.dart';

import '../../models/exchanges_model/exchanges_model.dart';

abstract class ExchangesState extends Equatable {
  const ExchangesState();

  @override
  List<Object> get props => [];
}

class ExchangesInitial extends ExchangesState {
  const ExchangesInitial();
}

class ExchangesLoadingState extends ExchangesState {}

class ExchangesLoadedState extends ExchangesState {
  const ExchangesLoadedState(this.exchanges);
  final List<ExchangesModel> exchanges;

  @override
  List<Object> get props => [exchanges];
}

class ExchangesErrorState extends ExchangesState {
  const ExchangesErrorState(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
