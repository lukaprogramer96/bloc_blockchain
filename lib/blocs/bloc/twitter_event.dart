part of 'twitter_bloc.dart';

abstract class TwitterEvent extends Equatable {
  const TwitterEvent();

  @override
  List<Object> get props => [];
}

class GetTwitterDataEvent extends TwitterEvent {
  @override
  List<Object> get props => [twitterCoinId];

  final String twitterCoinId;
  const GetTwitterDataEvent({
    required this.twitterCoinId,
  });
}
