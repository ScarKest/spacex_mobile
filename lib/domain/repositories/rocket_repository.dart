import 'package:dartz/dartz.dart';

import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/domain/entities/rocket.dart';

abstract class RocketRepository {
  Future<Either<Failure, List<Rocket>>> getRockets();
}
