import 'package:dartz/dartz.dart';

import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/data/models/ship_model.dart';

abstract class ShipRepository {
  Future<Either<Failure, ShipModel>> getShips();
}
