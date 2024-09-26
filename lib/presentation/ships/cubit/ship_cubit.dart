import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:spacex_mobile/core/errors/failure.dart';
import 'package:spacex_mobile/data/models/ship_model.dart';
import 'package:spacex_mobile/domain/uses_cases/ship/get_ships.dart';

part 'ship_state.dart';

class ShipCubit extends Cubit<ShipState> {
  ShipCubit({required this.getShips}) : super(ShipInitial());

  final GetShips getShips;

  void getShip() async {
    emit(ShipInitial());
    final getShip = await getShips();
    emit(_eitherLoadedOrErrorState(getShip));
  }

  ShipState _eitherLoadedOrErrorState(
      Either<Failure, ShipModel> failureOrShip) {
    return failureOrShip.fold(
        (failure) => ShipError(error: failure.toString()),
        (shipResponse) => ShipSuccess(ship: shipResponse));
  }
}
