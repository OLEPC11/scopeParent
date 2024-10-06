import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Homework/Data/Repo/ShowResponsesForHomeworkEnteredDayServices.dart';
import 'package:scope_parent/Features/Homework/Data/Repo/ShowResponsesForHomeworkServices.dart';

import '../../Data/Model/ResponseModel.dart';

part 'ShowResponseState.dart';

class ShowResponseCubit extends Cubit<ShowResponseState> {
  ShowResponseCubit() : super(ShowResponseInitial());

  dynamic nameChild;
  dynamic accessToken;
  dynamic day;
  dynamic month;
  dynamic year;
  List<ResponseModel> responseModel=[];
  void showResponseServices ({
    required dynamic accessToken,
    required dynamic nameChild,
    required dynamic type,
    dynamic day,
    dynamic month,
    dynamic year,
  }) async{
    emit(ShowResponseLoading());
    try{
      if(type=="day"){
        responseModel =await ShowResponsesForHomeworkServices().showResponsesForHomeworkServices(
          accessToken:accessToken,
          studentName: nameChild,
        );
        emit(ShowResponseSuccess(responseModel: responseModel));
      }
      else if(type=="Entered day"){
        responseModel =await ShowResponsesForHomeworkEnteredDayServices().showResponsesForHomeworkEnteredDayServices(
          accessToken:accessToken,
          studentName: nameChild,
          day: day,
          month: month,
          year: year,
        );
        emit(ShowResponseSuccess(responseModel: responseModel));
      }
    }catch (e){

      //emit(HomeworkFailure(errorMessage:e.toString()));
      emit(ShowResponseFailure(errorMessage:"Try Again"));
    }
  }
}
