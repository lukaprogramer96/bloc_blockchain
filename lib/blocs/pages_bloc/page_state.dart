part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class PageLoadingState extends PageState {
  @override
  List<Object> get props => [];
}

class PageLoadedState extends PageState {
  const PageLoadedState(this.onePage);
  final PagesModel? onePage;
}

class PageErrorState extends PageState {
  const PageErrorState(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
