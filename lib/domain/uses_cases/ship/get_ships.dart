import 'package:dartz/dartz.dart';
import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/data/models/ship_model.dart';
import 'package:spacex_mobile/domain/repositories/ship_repository.dart';

class GetShips {
  final ShipRepository shipRepository;

  GetShips({required this.shipRepository});

  Future<Either<Failure, ShipModel>> call() async {
    return shipRepository.getShips();
  }
}
