import 'package:dartz/dartz.dart';
import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/data/datasources/ships_remote_datasource.dart';
import 'package:spacex_mobile/data/models/ship_model.dart';
import 'package:spacex_mobile/domain/repositories/ship_repository.dart';

class ShipRepositoryImpl implements ShipRepository {
  final ShipsRemoteDatasource remoteDatasource;

  ShipRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, ShipModel>> getShips() async {
    try {
      final ship = await remoteDatasource.getShips();
      return Right(ship);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
