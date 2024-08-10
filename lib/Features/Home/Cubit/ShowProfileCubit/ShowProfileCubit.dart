import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Home/Data/Model/ProfileUserModel.dart';
import 'package:scope_parent/Features/Home/Data/Repo/ShowProfileServices.dart';

part 'ShowProfileState.dart';

class ShowProfileCubit extends Cubit<ShowProfileState> {
  ShowProfileCubit() : super(ShowProfileInitial());

  dynamic password;
  dynamic accessToken;
  ProfileUserModel? profileUserModel;
  void showProfileServices ({
    required dynamic accessToken,
  }) async{
    emit(ShowProfileLoading());
    try{
      profileUserModel =await ShowProfileServices().showProfileServices(
        accessToken: accessToken,
      );
      emit(ShowProfileSuccess(profileUserModel: profileUserModel!));
    }catch (e){
      emit(ShowProfileFailure(errorMessage:"Try Again"));
    }
  }
}
