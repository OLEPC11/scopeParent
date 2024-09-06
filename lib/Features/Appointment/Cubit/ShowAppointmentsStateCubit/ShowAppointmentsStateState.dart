part of 'ShowAppointmentsStateCubit.dart';
@immutable
sealed class ShowAppointmentsStateState {}

final class ShowAppointmentsStateInitial extends ShowAppointmentsStateState {}
class ShowAppointmentsStateLoading extends ShowAppointmentsStateState {}
class ShowAppointmentsStateSuccess extends ShowAppointmentsStateState {
  List<AppointmentsStateModel> appointmentsStateModel;
  ShowAppointmentsStateSuccess({required this.appointmentsStateModel});
}
class ShowAppointmentsStateFailure extends ShowAppointmentsStateState {
  String errorMessage;
  ShowAppointmentsStateFailure({required this.errorMessage});
}