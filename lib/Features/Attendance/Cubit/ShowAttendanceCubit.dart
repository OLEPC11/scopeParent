import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Attendance/Data/Model/AttendanceModel.dart';
import 'package:scope_parent/Features/Attendance/Data/Repo/ShowAttendanceDayServices.dart';
import 'package:scope_parent/Features/Attendance/Data/Repo/ShowAttendanceEnteredMonthServices.dart';
import '../Data/Repo/ShowAttendanceEnteredDayServices.dart';
import '../Data/Repo/ShowAttendanceMonthServices.dart';
part 'ShowAttendanceState.dart';

class ShowAttendanceCubit extends Cubit<ShowAttendanceState> {
  ShowAttendanceCubit() : super(ShowAttendanceInitial());
  dynamic nameChild;
  dynamic accessToken;
  dynamic type;
  dynamic month;
  dynamic year;
  dynamic dayEntered;
  dynamic monthForDay;
  dynamic yearForDay;
  AttendanceModel? attendanceModel;
  void showShowAttendanceServices ({
    required dynamic nameChild,
    required dynamic type,
    required dynamic accessToken,
    dynamic month,
    dynamic year,
    dynamic dayEntered,
    dynamic monthForDay,
    dynamic yearForDay,
  }) async{
    emit(ShowAttendanceLoading());
    try{
      if(type=="day"){
        attendanceModel =await ShowAttendanceDayServices().showAttendanceDayServices(
          name: nameChild,
          accessToken: accessToken,
        );
        emit(ShowAttendanceSuccess(attendanceModel:attendanceModel!));
      }
      else if(type=="Entered day"){
        attendanceModel =await ShowAttendanceEnteredDayServices().showAttendanceEnteredDayServices(
          name: nameChild,
          accessToken: accessToken,
          day:dayEntered ,
          month: monthForDay,
          year: yearForDay,
        );
        emit(ShowAttendanceSuccess(attendanceModel:attendanceModel!));
      }
      else if(type=="month"){
        attendanceModel =await ShowAttendanceMonthServices().showAttendanceMonthServices(
          accessToken: accessToken,
          name: nameChild,
        );
        emit(ShowAttendanceSuccess(attendanceModel: attendanceModel!));
      }
      else if(type=="Entered month"){
        attendanceModel =await ShowAttendanceEnteredMonthServices().showAttendanceEnteredMonthServices(
          accessToken: accessToken,
          name: nameChild,
          month: month,
          year: year,
        );
        emit(ShowAttendanceSuccess(attendanceModel: attendanceModel!));
      }
    }catch (e){
      //emit(ShowAttendanceFailure(errorMessage:e.toString()));
      emit(ShowAttendanceFailure(errorMessage:"Try Again"));
    }
  }
}
