// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'options_event.dart';
part 'options_state.dart';

class OptionsBloc extends Bloc<OptionsEvent, OptionsState> {
  OptionsBloc() : super(OptionsLoadedState()) {
    on<LoadOptionsEvent>((event, emit) async {
      emit(OptionsLoadingState());
      try {
        emit(OptionsLoadedState());
      } catch (e) {
        emit(OptionsErrorState(e.toString()));
      }
    });
    on<TwitterEvent>((event, emit) async {
      emit(OptionsLoadedTwitterState());
    });
  }
}
