import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Activities/Data/Model/ActivitiesModel.dart';
import 'package:scope_parent/Features/Activities/Data/Repo/ShowActivitiesServices.dart';

part 'ShowActivitiesState.dart';

class ShowActivitiesCubit extends Cubit<ShowActivitiesState> {
  ShowActivitiesCubit() : super(ShowActivitiesInitial());

  List<ActivitiesModel>? activitiesModel ;
  void showActivitiesServices () async{
    emit(ShowActivitiesLoading());
    try{
      activitiesModel =await ShowActivitiesServices().showActivitiesServices();
      emit(ShowActivitiesSuccess(activitiesModel: activitiesModel!));
    }catch (e){
      emit(ShowActivitiesFailure(errorMessage:"Try Again"));
    }
  }
}
