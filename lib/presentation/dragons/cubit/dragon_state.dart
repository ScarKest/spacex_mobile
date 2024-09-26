part of 'dragon_cubit.dart';

@immutable
sealed class DragonState {}

final class DragonInitial extends DragonState {}

final class DragonLoading extends DragonState {}

final class DragonError extends DragonState {
  final String error;

  DragonError({required this.error});
}

final class DragonSuccess extends DragonState {
  final DragonModel dragon;

  DragonSuccess({required this.dragon});
}
