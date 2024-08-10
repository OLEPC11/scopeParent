import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../Data/Model/EvaluationsMonthModel.dart';
import '../../Data/Repo/ShowEvaluationsMonthServices.dart';
part 'ShowEvaluationsMonthState.dart';

class ShowEvaluationsMonthCubit extends Cubit<ShowEvaluationsMonthState> {
  ShowEvaluationsMonthCubit() : super(ShowEvaluationsMonthInitial());

  dynamic nameChild;
  dynamic month;
  dynamic year;
  dynamic categoryClass;
  dynamic accessToken;
  dynamic type;
  EvaluationsMonthModel? evaluationsMonthModel;
  void showShowEvaluationsMonthServices ({
    required dynamic nameChild,
    required dynamic month,
    required dynamic year,
    required dynamic categoryClass,
    required dynamic accessToken,
  }) async{
    emit(ShowEvaluationsMonthLoading());
    try{
      evaluationsMonthModel =await ShowEvaluationsMonthServices().showEvaluationsMonthServices(
        name: nameChild,
        category: categoryClass,
        month: month,
        year: year,
        accessToken: accessToken,
      );
      emit(ShowEvaluationsMonthSuccess(evaluationsMonthModel:evaluationsMonthModel!));

    }catch (e){
      emit(ShowEvaluationsMonthFailure(errorMessage:e.toString()));
      // emit(ShowEvaluationsFailure(errorMessage:"Try Again"));
    }
  }
}
