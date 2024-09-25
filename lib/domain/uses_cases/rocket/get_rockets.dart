import 'package:dartz/dartz.dart';
import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/data/models/rocket_model.dart';
import 'package:spacex_mobile/domain/repositories/rocket_repository.dart';

class GetRockets {
  final RocketRepository rocketRepository;

  GetRockets({required this.rocketRepository});

  Future<Either<Failure, RocketModel>> call() async {
    return rocketRepository.getRockets();
  }
}
