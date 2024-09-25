part of 'rocket_cubit.dart';

@immutable
sealed class RocketState {}

final class RocketInitial extends RocketState {}

final class RocketLoading extends RocketState {}

final class RocketError extends RocketState {
  final String error;

  RocketError({required this.error});
}

final class RocketSuccess extends RocketState {
  final RocketModel rocket;

  RocketSuccess({required this.rocket});
}
