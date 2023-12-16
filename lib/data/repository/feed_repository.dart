import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:konnect/data/data_source/binding/local/binding_local.dart';
import 'package:konnect/data/data_source/common/base_datasource_factory.dart';
import 'package:konnect/data/data_source/datasource_factory.dart';
import 'package:konnect/data/mapper/mapper.dart';
import 'package:konnect/data/models/feed.dart';
import 'package:konnect/domain/entities/failure.dart';
import 'package:konnect/domain/entities/feed.dart';
import 'package:konnect/domain/repository/feed_repository.dart';


class FeedRepositoryImpl extends FeedRepository {
  final BindingDataSourceFactory bindingDataSourceFactory;
  FeedRepositoryImpl(this.bindingDataSourceFactory);
  @override
  Future<Either<Failure, List<FeedData>>> fetchData(String path) async {
    BindingLocal? bindingLocal = bindingDataSourceFactory
        .createData(DataSourceState.local) as BindingLocal;
    try {
      final jsonFromAssetPath = await bindingLocal.getJsonStringFromAsset(path);

      final data = jsonDecode(jsonFromAssetPath);
      final response = FeedResponse.fromJson(
        data,
      );

      return Right(response.toDomain());
    } catch (error) {
      return (Left(Failure(401, error.toString())));
    }
  }
}
