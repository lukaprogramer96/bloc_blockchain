part of 'options_bloc.dart';

abstract class OptionsState extends Equatable {
  const OptionsState();

  @override
  List<Object> get props => [];
}

class OptionsLoadingState extends OptionsState {}

class OptionsLoadedState extends OptionsState {}

class OptionsErrorState extends OptionsState {
  const OptionsErrorState(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
