import 'package:get_it/get_it.dart';
import 'package:spacex_mobile/data/datasources/rockets_remote_datasource.dart';
import 'package:spacex_mobile/data/repositories/rocket_repository_impl.dart';
import 'package:spacex_mobile/domain/repositories/rocket_repository.dart';
import 'package:spacex_mobile/domain/uses_cases/rocket/get_rockets.dart';
import 'package:spacex_mobile/presentation/rockets/cubit/rocket_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  initRocketDependencies(sl);

  sl.registerLazySingleton(() => http.Client());
}

void initRocketDependencies(GetIt sl) {
  sl
    // BLoCs
    ..registerFactory(() => RocketCubit(getRockets: sl()))
    // use cases
    ..registerLazySingleton(() => GetRockets(rocketRepository: sl()))
    // Repository
    ..registerLazySingleton<RocketRepository>(
        () => RocketRepositoryImpl(remoteDatasource: sl()))
    // Data sources
    ..registerLazySingleton<RocketsRemoteDatasource>(
        () => RocketsRemoteDatasourceImpl(client: sl()));
}
