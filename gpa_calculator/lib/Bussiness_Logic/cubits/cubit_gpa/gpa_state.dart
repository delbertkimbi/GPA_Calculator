part of 'gpa_cubit.dart';

abstract class CgpaState {}

final class GpaInitial extends CgpaState {}

final class GpaLoading extends CgpaState {}

final class GpaLoaded extends CgpaState {}

final class CgpaError extends CgpaState {
  final String error;

  CgpaError({required this.error});
}
