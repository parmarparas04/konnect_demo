import 'package:dartz/dartz.dart';
import 'package:konnect/domain/entities/failure.dart';
import 'package:konnect/domain/entities/feed.dart';
import 'package:konnect/domain/entities/home.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeData>>> fetchHomeData(String path);
}
