import 'package:get_it/get_it.dart';
import 'package:spacex_mobile/data/datasources/rockets_remote_datasource.dart';
import 'package:spacex_mobile/data/datasources/ships_remote_datasource.dart';
import 'package:spacex_mobile/data/repositories/rocket_repository_impl.dart';
import 'package:spacex_mobile/data/repositories/ship_repository_impl.dart';
import 'package:spacex_mobile/domain/repositories/rocket_repository.dart';
import 'package:spacex_mobile/domain/repositories/ship_repository.dart';
import 'package:spacex_mobile/domain/uses_cases/rocket/get_rockets.dart';
import 'package:spacex_mobile/domain/uses_cases/ship/get_ships.dart';
import 'package:spacex_mobile/presentation/rockets/cubit/rocket_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:spacex_mobile/presentation/ships/cubit/ship_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initRocketDependencies(sl);

  sl.registerLazySingleton(() => http.Client());
}

void initRocketDependencies(GetIt sl) {
  sl
    // BLoCs
    ..registerFactory(() => RocketCubit(getRockets: sl()))
    ..registerFactory(() => ShipCubit(getShips: sl()))
    // use cases
    ..registerLazySingleton(() => GetRockets(rocketRepository: sl()))
    ..registerLazySingleton(() => GetShips(shipRepository: sl()))
    // Repository
    ..registerLazySingleton<RocketRepository>(
        () => RocketRepositoryImpl(remoteDatasource: sl()))
    ..registerLazySingleton<ShipRepository>(
        () => ShipRepositoryImpl(remoteDatasource: sl()))
    // Data sources
    ..registerLazySingleton<RocketsRemoteDatasource>(
        () => RocketsRemoteDatasourceImpl(client: sl()))
    ..registerLazySingleton<ShipsRemoteDatasource>(
        () => ShipsRemoteDatasourceImpl(client: sl()));
}
