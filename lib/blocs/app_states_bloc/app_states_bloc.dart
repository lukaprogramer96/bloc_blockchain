// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_reso_coder/repos/crypto_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/user_model/user_model.dart';

part 'app_states_event.dart';
part 'app_states_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final CryptoRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
