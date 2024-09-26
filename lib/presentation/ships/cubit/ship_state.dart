part of 'ship_cubit.dart';

@immutable
sealed class ShipState {}

final class ShipInitial extends ShipState {}

final class ShipLoading extends ShipState {}

final class ShipError extends ShipState {
  final String error;

  ShipError({required this.error});
}

final class ShipSuccess extends ShipState {
  final ShipModel ship;

  ShipSuccess({required this.ship});
}
