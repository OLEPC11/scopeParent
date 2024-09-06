part of 'ShowAppointmentCubit.dart';

@immutable
sealed class ShowAppointmentState {}

final class ShowAppointmentInitial extends ShowAppointmentState {}
class ShowAppointmentLoading extends ShowAppointmentState {}
class ShowAppointmentSuccess extends ShowAppointmentState {
  List<AppointmentsModel> appointmentsModel;
  ShowAppointmentSuccess({required this.appointmentsModel});
}
class ShowAppointmentFailure extends ShowAppointmentState {
  String errorMessage;
  ShowAppointmentFailure({required this.errorMessage});
}