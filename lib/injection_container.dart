import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:get_it/get_it.dart';
import 'package:konnect/data/data_source/binding/local/binding_local.dart';
import 'package:konnect/data/data_source/binding/remote/binding_remote.dart';
import 'package:konnect/data/data_source/datasource_factory.dart';
import 'package:konnect/data/network/app_api.dart';
import 'package:konnect/data/network/dio_factory.dart';
import 'package:konnect/data/network/network_info.dart';
import 'package:konnect/data/repository/feed_repository.dart';
import 'package:konnect/data/repository/home_repository.dart';
import 'package:konnect/domain/repository/feed_repository.dart';
import 'package:konnect/domain/repository/home_repository.dart';
import 'package:konnect/domain/usecases/feed_usecase.dart';
import 'package:konnect/domain/usecases/home_usecase.dart';
import 'package:konnect/presentation/pages/feed_list/bloc/bloc.dart';
import 'package:konnect/presentation/pages/home/bloc/bloc.dart';

final instance = GetIt.instance;

Future<void> initializeDependencies() async {
  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<BindingRemote>(
      () => BindingRemoteImpl(instance(), instance()));

  instance.registerLazySingleton<BindingLocal>(() => BindingLocalImpl());

  instance.registerFactory<BindingDataSourceFactory>(
    () => BindingDataSourceFactory(
        bindingRemote: instance(), bindingLocal: instance()),
  );
  // for feed
  instance.registerLazySingleton<FeedRepository>(
      () => FeedRepositoryImpl(instance()));

  instance.registerLazySingleton(() => FeedUseCase(instance()));
  instance.registerFactory<FeedListBloc>(() => FeedListBloc(instance()));

  // for home
  instance.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(instance()));

  instance.registerLazySingleton(() => HomeUseCase(instance()));
  instance.registerFactory<HomeBloc>(() => HomeBloc(instance()));
}
