import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/domain/entities/rocket.dart';
import 'package:spacex_mobile/domain/uses_cases/rocket/get_rockets.dart';

part 'rocket_state.dart';

class RocketCubit extends Cubit<RocketState> {
  RocketCubit({required this.getRockets}) : super(RocketInitial());

  final GetRockets getRockets;
  
  void getRocket() async {
    emit(RocketError(error: 'Error fatal'));
    final getRocket = await getRockets();
    emit(_eitherLoadedOrErrorState(getRocket));
  }

  RocketState _eitherLoadedOrErrorState(
      Either<Failure, List<Rocket>> failureOrRocket) {
    return failureOrRocket.fold(
        (failure) => RocketError(error: failure.toString()),
        (rocketResponse) => RocketSuccess(rocket: rocketResponse));
  }
}
