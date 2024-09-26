import 'package:dartz/dartz.dart';
import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/data/models/dragon_model.dart';
import 'package:spacex_mobile/domain/repositories/dragon_repository.dart';

class GetDragons {
  final DragonRepository dragonRepository;

  GetDragons({required this.dragonRepository});

  Future<Either<Failure, DragonModel>> call() async {
    return dragonRepository.getDragons();
  }
}
