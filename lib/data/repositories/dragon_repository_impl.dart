import 'package:dartz/dartz.dart';
import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/data/datasources/dragons_remote_datasource.dart';
import 'package:spacex_mobile/data/models/dragon_model.dart';
import 'package:spacex_mobile/domain/repositories/dragon_repository.dart';

class DragonRepositoryImpl implements DragonRepository {
  final DragonsRemoteDatasource remoteDatasource;

  DragonRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, DragonModel>> getDragons() async {
    try {
      final dragon = await remoteDatasource.getDragons();
      return Right(dragon);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
