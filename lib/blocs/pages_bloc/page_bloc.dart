// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/page_repository.dart';
import '../../models/pages_model/pages_model.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageLoadingState()) {
    on<LoadPageEvent>((event, emit) async {
      emit(PageLoadingState());
      try {
        final page = await PageRepository.getPage();
        emit(PageLoadedState(page));
      } catch (e) {
        emit(PageErrorState(e.toString()));
      }
    });
  }
}
