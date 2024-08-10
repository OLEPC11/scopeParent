import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Attendance/Data/Model/AttendanceModel.dart';
import 'package:scope_parent/Features/Attendance/Data/Repo/ShowAttendanceDayServices.dart';
import '../Data/Repo/ShowAttendanceMonthServices.dart';
part 'ShowAttendanceState.dart';

class ShowAttendanceCubit extends Cubit<ShowAttendanceState> {
  ShowAttendanceCubit() : super(ShowAttendanceInitial());
  dynamic nameChild;
  dynamic dateDay;
  dynamic dateMonth;
  dynamic accessToken;
  dynamic type;
  AttendanceModel? attendanceModel;
  void showShowAttendanceServices ({
    required dynamic nameChild,
    required dynamic dateDay,
    required dynamic dateMonth,
    required dynamic type,
    required dynamic accessToken,
  }) async{
    emit(ShowAttendanceLoading());
    try{
      if(type=="day"){
        attendanceModel =await ShowAttendanceDayServices().showAttendanceDayServices(
          name: nameChild,
          date: dateDay,
          accessToken: accessToken,
        );
        emit(ShowAttendanceSuccess(attendanceModel:attendanceModel!));
      }
      else if(type=="month"){
        attendanceModel =await ShowAttendanceMonthServices().showAttendanceMonthServices(
          accessToken: accessToken,
          name: nameChild,
          date: dateMonth,
        );
        emit(ShowAttendanceSuccess(attendanceModel: attendanceModel!));
      }
    }catch (e){
      //emit(ShowAttendanceFailure(errorMessage:e.toString()));
      emit(ShowAttendanceFailure(errorMessage:"Try Again"));
    }
  }
}
