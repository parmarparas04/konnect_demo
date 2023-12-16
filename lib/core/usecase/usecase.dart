import 'package:dartz/dartz.dart';
import 'package:konnect/domain/entities/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
