import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Home/Data/Repo/EditProfileServices.dart';

part 'EditProfileState.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  dynamic firstName;
  dynamic lastName;
  dynamic phoneNumber;
  dynamic password;
  dynamic image;
  dynamic accessToken;
  dynamic message;
  void editProfileServices ({
    required dynamic image,
    required dynamic firstName,
    required dynamic lastName,
    required dynamic phoneNumber,
    required dynamic password,
    required dynamic accessToken,
  }) async{
    emit(EditProfileLoading());
    try{
      if(image!=null){
        Map<String,dynamic> user=await EditProfileServices().editProfileServices(
          image:image,
          firstName:firstName,
          lastName:lastName,
          phoneNumber:phoneNumber,
          password: password,
          accessToken: accessToken,
        );
        message=user["message"];
        emit(EditProfileSuccess());
      }
      else{
        Map<String,dynamic> user=await EditProfileServices().editProfileServicesWithoutImage(
          firstName:firstName,
          lastName:lastName,
          phoneNumber:phoneNumber,
          password: password,
          accessToken: accessToken,
        );
        message=user["message"];
        emit(EditProfileSuccess());
      }
    }catch (e){
      emit(EditProfileFailure(errorMessage:"Incorrect Details. Please try again"));
    }
  }
}
