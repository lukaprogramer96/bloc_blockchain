part of 'twitter_bloc.dart';

abstract class TwitterState extends Equatable {
  const TwitterState();

  @override
  List<Object> get props => [];
}

class TwitterLoadingState extends TwitterState {}

class TwitterLoadedState extends TwitterState {
  const TwitterLoadedState(this.twitterList);
  final List<TwitterModel>? twitterList;
}

class TwitterErrorState extends TwitterState {
  const TwitterErrorState(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
