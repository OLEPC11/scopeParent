import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/ChildDetails/Data/Model/ChildModel.dart';
import 'package:scope_parent/Features/ChildDetails/Data/Repo/ShowAllChildServices.dart';

part 'ShowAllChildState.dart';

class ShowAllChildCubit extends Cubit<ShowAllChildState> {
  ShowAllChildCubit() : super(ShowAllChildInitial());

  dynamic accessToken;
  List<ChildModel> childModel=[];
  void showAllChildServices ({
    required dynamic accessToken,
  }) async{
    emit(ShowAllChildLoading());
    try{
      childModel =await ShowAllChildServices().showAllChildServices(
        accessToken: accessToken,
      );
      emit(ShowAllChildSuccess(childModelList: childModel));
    }catch (e){
      emit(ShowAllChildFailure(errorMessage:"Try Again"));
    }
  }
}
