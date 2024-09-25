import 'package:dartz/dartz.dart';

import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/data/models/rocket_model.dart';

abstract class RocketRepository {
  Future<Either<Failure, RocketModel>> getRockets();
}
