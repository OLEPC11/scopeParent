part of 'ShowAttendanceCubit.dart';

@immutable
sealed class ShowAttendanceState {}

final class ShowAttendanceInitial extends ShowAttendanceState {}
class ShowAttendanceLoading extends ShowAttendanceState {}
class ShowAttendanceSuccess extends ShowAttendanceState {
  AttendanceModel attendanceModel ;
  ShowAttendanceSuccess({required this.attendanceModel});
}
class ShowAttendanceFailure extends ShowAttendanceState {
  String errorMessage;
  ShowAttendanceFailure({required this.errorMessage});
}