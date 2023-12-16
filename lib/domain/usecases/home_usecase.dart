import 'package:dartz/dartz.dart';
import 'package:konnect/core/usecase/usecase.dart';
import 'package:konnect/domain/entities/failure.dart';
import 'package:konnect/domain/entities/feed.dart';
import 'package:konnect/domain/entities/home.dart';
import 'package:konnect/domain/repository/feed_repository.dart';
import 'package:konnect/domain/repository/home_repository.dart';

class HomeUseCase implements BaseUseCase<HomeUseCaseInput, List<HomeData>> {
  final HomeRepository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, List<HomeData>>> execute(
      HomeUseCaseInput input) async {
    return await _repository.fetchHomeData(input.assetPath);
  }
}

class HomeUseCaseInput {
  String assetPath;
  HomeUseCaseInput(this.assetPath);
}
