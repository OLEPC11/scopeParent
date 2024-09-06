import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Register/Data/Model/RegisterUserModel.dart';
import 'package:scope_parent/Features/Register/Data/Repo/RegisterUserServices.dart';
part 'RegisterState.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  dynamic firstName;
  dynamic lastName;
  dynamic phoneNumber;
  dynamic email;
  dynamic password;
  dynamic image;
  RegisterUserModel? registerUserModel;

  void registerServices ({
    required dynamic image,
    required dynamic firstName,
    required dynamic lastName,
    required dynamic phoneNumber,
    required dynamic email,
    required dynamic password,
  }) async{
    emit(RegisterLoading());
    try{
      registerUserModel =await RegisterUserServices().registerServices(
        image:image,
        firstName:firstName,
        lastName:lastName,
        phoneNumber:phoneNumber,
        email:email,
        password:password,
      );
      emit(RegisterSuccess());
    }catch (e){
      emit(RegisterFailure(errorMessage:"Incorrect Details. Please try again"));
    }
  }
}
