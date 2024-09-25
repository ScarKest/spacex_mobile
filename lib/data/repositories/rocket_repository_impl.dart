import 'package:dartz/dartz.dart';
import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/data/datasources/rockets_remote_datasource.dart';
import 'package:spacex_mobile/domain/entities/rocket.dart';
import 'package:spacex_mobile/domain/repositories/rocket_repository.dart';

class RocketRepositoryImpl implements RocketRepository {
  final RocketsRemoteDatasource remoteDatasource;

  RocketRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, List<Rocket>>> getRockets() async {
    try {
      final rocket = await remoteDatasource.getRockets();
      //TODO Revisar este model
      return Right(rocket as List<Rocket>);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
