import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/Model/EvaluationsDayModel.dart';
import '../../Data/Repo/ShowEvaluationsDayServices.dart';

part 'ShowEvaluationsDayState.dart';

class ShowEvaluationsDayCubit extends Cubit<ShowEvaluationsDayState> {
  ShowEvaluationsDayCubit() : super(ShowEvaluationsDayInitial());
  dynamic nameChild;
  dynamic categoryClass;
  dynamic accessToken;
  dynamic type;
  EvaluationsDayModel? evaluationsDayModel;
  void showShowEvaluationsServices ({
    required dynamic nameChild,
    required dynamic categoryClass,
    required dynamic accessToken,
  }) async{
    emit(ShowEvaluationsDayLoading());
    try{
      evaluationsDayModel =await ShowEvaluationsDayServices().showEvaluationsDayServices(
        name: nameChild,
        category: categoryClass,
        accessToken: accessToken,
      );
      emit(ShowEvaluationsDaySuccess(evaluationsDayModel: evaluationsDayModel!));
    }catch (e){
      emit(ShowEvaluationsDayFailure(errorMessage:e.toString()));
      // emit(ShowEvaluationsFailure(errorMessage:"Try Again"));
    }
  }
}
