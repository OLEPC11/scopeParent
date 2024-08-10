import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Homework/Data/Repo/ShowHomeworkServices.dart';
import '../Data/Model/HomeworkModel.dart';

part 'HomeworkState.dart';

class HomeworkCubit extends Cubit<HomeworkState> {
  HomeworkCubit() : super(HomeworkInitial());

  dynamic day;
  dynamic month;
  dynamic year;
  dynamic categoryId;
  List<HomeworkModel> homeworkModel=[];
  void showHomeworkServices ({
    required dynamic day,
    required dynamic month,
    required dynamic year,
    required dynamic categoryId,
}) async{
    emit(HomeworkLoading());
    try{
      homeworkModel =await ShowHomeworkServices().showHomeworkServices(
        day: day,
        month: month,
        year: year,
        categoryId:categoryId,
      );
      emit(HomeworkSuccess(homeworkModel: homeworkModel));
    }catch (e){
      //emit(HomeworkFailure(errorMessage:e.toString()));
      emit(HomeworkFailure(errorMessage:"Try Again"));
    }
  }
}
