import 'dart:convert';

import 'package:konnect/data/models/feed.dart';
import 'package:konnect/domain/usecases/feed_usecase.dart';
import 'package:konnect/domain/usecases/home_usecase.dart';
import 'package:konnect/injection_container.dart';

import './event.dart';
import './state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase _useCase;

  HomeBloc(this._useCase) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      final response =
          await _useCase.execute(HomeUseCaseInput(event.assetPath));
      response.fold((failure) => emit(HomeErrorState(failure.message)), (auth) {
        emit(HomeLoadedState(auth));
      });
    });
  }
}
