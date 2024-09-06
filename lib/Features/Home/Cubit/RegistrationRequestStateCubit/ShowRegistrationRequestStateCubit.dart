import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/Model/RegistrationRequestStateModel.dart';
import '../../Data/Repo/ShowRegistrationRequestStateServices.dart';

part 'ShowRegistrationRequestStateState.dart';

class ShowRegistrationRequestStateCubit extends Cubit<ShowRegistrationRequestStateState> {
  ShowRegistrationRequestStateCubit() : super(ShowRegistrationRequestStateInitial());

  dynamic accessToken;
  List<RegistrationRequestStateModel>? registrationRequestStateModel;
  void showRegistrationRequestStateServices ({required accessToken}) async{
    emit(ShowRegistrationRequestStateLoading());
    try{
      registrationRequestStateModel =await ShowRegistrationRequestStateServices().showRegistrationRequestStateServices(accessToken: accessToken);
      emit(ShowRegistrationRequestStateSuccess(registrationRequestStateModel: registrationRequestStateModel!));
    }catch (e){
      emit(ShowRegistrationRequestStateFailure(errorMessage:"Try Again"));
    }
  }
}
