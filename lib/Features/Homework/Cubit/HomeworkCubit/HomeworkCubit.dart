import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Homework/Data/Repo/ShowHomeworkServices.dart';
import '../../Data/Model/HomeworkModel.dart';
import '../../Data/Repo/ShowEnteredDayHomeworkServices.dart';

part 'HomeworkState.dart';

class HomeworkCubit extends Cubit<HomeworkState> {
  HomeworkCubit() : super(HomeworkInitial());


  dynamic categoryId;
  dynamic type;
  dynamic day;
  dynamic month;
  dynamic year;
  List<HomeworkModel> homeworkModel=[];
  void showHomeworkServices ({
    required dynamic categoryId,
    required dynamic type,
    dynamic day,
    dynamic month,
    dynamic year,
}) async{
    emit(HomeworkLoading());
    try{
      if(type=="day"){
        homeworkModel =await ShowHomeworkServices().showHomeworkServices(
          categoryId:categoryId,
        );
        emit(HomeworkSuccess(homeworkModel: homeworkModel));
      }
      else if(type=="Entered day"){
        homeworkModel =await ShowEnteredDayHomeworkServices().showEnteredDayHomeworkServices(
          categoryId:categoryId,
          day: day,
          month: month,
          year: year,
        );
        emit(HomeworkSuccess(homeworkModel: homeworkModel));
      }
    }catch (e){
      //emit(HomeworkFailure(errorMessage:e.toString()));
      emit(HomeworkFailure(errorMessage:"Try Again"));
    }
  }
}
