import 'package:dartz/dartz.dart';
import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/domain/entities/rocket.dart';
import 'package:spacex_mobile/domain/repositories/rocket_repository.dart';

class GetRockets {
  final RocketRepository rocketRepository;

  GetRockets({required this.rocketRepository});

  Future<Either<Failure, List<Rocket>>> call() async {
    return rocketRepository.getRockets();
  }
}
