import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Home/Data/Repo/LogoutServices.dart';

part 'LogoutState.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  void logoutServices ({
    required dynamic accessToken,
  }) async{
    emit(LogoutLoading());
    try{
      Map<String,dynamic>logout =await LogoutServices().logoutServices(
        accessToken: accessToken,
      );
      emit(LogoutSuccess());
    }catch (e){
      emit(LogoutFailure(errorMessage:"Try Again"));
    }
  }
}
