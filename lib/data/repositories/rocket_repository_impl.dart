import 'package:dartz/dartz.dart';
import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/data/datasources/rockets_remote_datasource.dart';
import 'package:spacex_mobile/data/models/rocket_model.dart';
import 'package:spacex_mobile/domain/repositories/rocket_repository.dart';

class RocketRepositoryImpl implements RocketRepository {
  final RocketsRemoteDatasource remoteDatasource;

  RocketRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, RocketModel>> getRockets() async {
    try {
      final rocket = await remoteDatasource.getRockets();
      return Right(rocket);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
