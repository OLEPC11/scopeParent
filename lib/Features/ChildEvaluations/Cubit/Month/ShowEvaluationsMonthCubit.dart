import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import '../../Data/Model/EvaluationsMonthModel.dart';
import '../../Data/Repo/ShowEvaluationsEnteredMonthServices.dart';
import '../../Data/Repo/ShowEvaluationsMonthServices.dart';
part 'ShowEvaluationsMonthState.dart';

class ShowEvaluationsMonthCubit extends Cubit<ShowEvaluationsMonthState> {
  ShowEvaluationsMonthCubit() : super(ShowEvaluationsMonthInitial());

  dynamic nameChild;
  dynamic categoryClass;
  dynamic accessToken;
  dynamic type;
  dynamic month;
  dynamic year;
  EvaluationsMonthModel? evaluationsMonthModel;
  void showShowEvaluationsMonthServices ({
    required dynamic type,
    required dynamic nameChild,
    required dynamic categoryClass,
    required dynamic accessToken,
    dynamic month,
    dynamic year,
  }) async{
    emit(ShowEvaluationsMonthLoading());
    try{
      if(type=="month"){
        evaluationsMonthModel =await ShowEvaluationsMonthServices().showEvaluationsMonthServices(
          name: nameChild,
          category: categoryClass,
          accessToken: accessToken,
        );
        emit(ShowEvaluationsMonthSuccess(evaluationsMonthModel:evaluationsMonthModel!));
      }
      else if(type=="Entered month"){
        evaluationsMonthModel =await ShowEvaluationsEnteredMonthServices().showEvaluationsEnteredMonthServices(
          name: nameChild,
          category: categoryClass,
          accessToken: accessToken,
          month:month,
          year: year,
        );
        emit(ShowEvaluationsMonthSuccess(evaluationsMonthModel:evaluationsMonthModel!));

      }
    }catch (e){
      emit(ShowEvaluationsMonthFailure(errorMessage:e.toString()));
      // emit(ShowEvaluationsFailure(errorMessage:"Try Again"));
    }
  }
}
