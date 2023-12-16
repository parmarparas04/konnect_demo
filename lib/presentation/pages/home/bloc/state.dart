import 'package:equatable/equatable.dart';
import 'package:konnect/domain/entities/feed.dart';
import 'package:konnect/domain/entities/home.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeUiInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  final String loadingStatus;

  HomeLoadingState(this.loadingStatus);
  @override
  List<Object?> get props => [loadingStatus];
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

class HomeLoadedState extends HomeState {
  final List<HomeData> data;

  HomeLoadedState(this.data);
  @override
  List<Object?> get props => [data];
}
