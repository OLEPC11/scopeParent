part of 'AddReservationCubit.dart';

@immutable
sealed class AddReservationState {}

final class AddReservationInitial extends AddReservationState {}
class AddReservationLoading extends AddReservationState {}
class AddReservationSuccess extends AddReservationState {}
class AddReservationFailure extends AddReservationState {
  String errorMessage;
  AddReservationFailure({required this.errorMessage});
}