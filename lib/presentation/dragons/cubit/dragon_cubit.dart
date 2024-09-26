import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/data/models/dragon_model.dart';
import 'package:spacex_mobile/domain/uses_cases/dragon/get_dragons.dart';

part 'dragon_state.dart';

class DragonCubit extends Cubit<DragonState> {
  DragonCubit({required this.getDragons}) : super(DragonInitial());

  final GetDragons getDragons;

  void getDragon() async {
    emit(DragonInitial());
    final getDragon = await getDragons();
    emit(_eitherLoadedOrErrorState(getDragon));
  }

  DragonState _eitherLoadedOrErrorState(
      Either<Failure, DragonModel> failureOrDragon) {
    return failureOrDragon.fold(
        (failure) => DragonError(error: failure.toString()),
        (dragonResponse) => DragonSuccess(dragon: dragonResponse));
  }
}
