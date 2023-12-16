import 'dart:convert';

import 'package:konnect/data/models/feed.dart';
import 'package:konnect/domain/usecases/feed_usecase.dart';
import 'package:konnect/injection_container.dart';

import './event.dart';
import './state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

class FeedListBloc
    extends Bloc<FeedListEvent, FeedListState> {
 

  final FeedUseCase _useCase;

  FeedListBloc(this._useCase) : super(FeedListInitial()) {
    on<FeedListEvent>((event, emit) async {
      final response =
          await _useCase.execute(FeedUseCaseUseCaseInput(event.assetPath));
      response
          .fold((failure) => emit(FeedListErrorState(failure.message)),
              (auth) {
        emit(FeedListLoadedState(auth));
      });
    });
  }
}
