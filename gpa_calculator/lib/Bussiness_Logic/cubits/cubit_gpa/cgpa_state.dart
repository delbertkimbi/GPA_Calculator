part of 'cgpa_cubit.dart';

abstract class CgpaState {}

final class CgpaInitial extends CgpaState {}

final class CgpaLoading extends CgpaState {}

final class CgpaLoaded extends CgpaState {}

final class CgpaError extends CgpaState {
  final String error;

  CgpaError({required this.error});
}
