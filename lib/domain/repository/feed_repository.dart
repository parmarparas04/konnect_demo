import 'package:dartz/dartz.dart';
import 'package:konnect/domain/entities/failure.dart';
import 'package:konnect/domain/entities/feed.dart';

abstract class FeedRepository {
  Future<Either<Failure, List<FeedData>>> fetchData(String path);
}
