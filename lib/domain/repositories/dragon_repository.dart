import 'package:dartz/dartz.dart';

import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/data/models/dragon_model.dart';

abstract class DragonRepository {
  Future<Either<Failure, DragonModel>> getDragons();
}
