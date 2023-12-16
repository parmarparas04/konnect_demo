import 'package:equatable/equatable.dart';
import 'package:konnect/domain/entities/feed.dart';

abstract class FeedListState extends Equatable {
  const FeedListState();
}

class FeedListInitial extends FeedListState {
  @override
  List<Object> get props => [];
}

class FeedListUiInitial extends FeedListState {
  @override
  List<Object> get props => [];
}

class FeedListLoadingState extends FeedListState {
  final String loadingStatus;

  FeedListLoadingState(this.loadingStatus);
  @override
  List<Object?> get props => [loadingStatus];
}

class FeedListErrorState extends FeedListState {
  final String message;

  FeedListErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

class FeedListLoadedState extends FeedListState {
  final List<FeedData> data;

  FeedListLoadedState(this.data);
  @override
  List<Object?> get props => [data];
}
