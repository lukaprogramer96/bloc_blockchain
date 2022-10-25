part of 'options_bloc.dart';

abstract class OptionsEvent extends Equatable {
  const OptionsEvent();

  @override
  List<Object> get props => [];
}

class LoadOptionsEvent extends OptionsEvent {}

class OptionsDetailsEvent extends OptionsEvent {
  const OptionsDetailsEvent();
}
