import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Login/Data/Model/LoginUserModel.dart';
import 'package:scope_parent/Features/Login/Data/Repo/LoginUserServices.dart';

part 'LoginState.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  dynamic phoneNumber;
  dynamic password;
  LoginUserModel? loginUserModel;

  void loginServices ({
    required dynamic phoneNumber,
    required dynamic password,
  }) async{
    emit(LoginLoading());
    try{
      loginUserModel =await LoginUserServices().loginServices(
        phoneNumber:phoneNumber,
        password:password,
      );
      emit(LoginSuccess());
    }catch (e){
      emit(LoginFailure(errorMessage:"Incorrect Details. Please try again"));
    }
  }
}
