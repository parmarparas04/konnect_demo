import 'package:dartz/dartz.dart';
import 'package:konnect/core/usecase/usecase.dart';
import 'package:konnect/domain/entities/failure.dart';
import 'package:konnect/domain/entities/feed.dart';
import 'package:konnect/domain/repository/feed_repository.dart';

class FeedUseCase
    implements BaseUseCase<FeedUseCaseUseCaseInput, List<FeedData>> {
  final FeedRepository _repository;

  FeedUseCase(this._repository);

  @override
  Future<Either<Failure, List<FeedData>>> execute(
      FeedUseCaseUseCaseInput input) async {
    return await _repository.fetchData(input.assetPath);
  }
}

class FeedUseCaseUseCaseInput {
  String assetPath;
  FeedUseCaseUseCaseInput(this.assetPath);
}
