import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/Model/AppointmentsStateModel.dart';
import '../../Data/Repo/ShowAppointmentsStateServices.dart';

part 'ShowAppointmentsStateState.dart';

class ShowAppointmentsStateCubit extends Cubit<ShowAppointmentsStateState> {
  ShowAppointmentsStateCubit() : super(ShowAppointmentsStateInitial());

  dynamic accessToken;
  List<AppointmentsStateModel>? appointmentsStateModel;
  void showAppointmentsStateServices ({required accessToken}) async{
    emit(ShowAppointmentsStateLoading());
    try{
      appointmentsStateModel =await ShowAppointmentsStateServices().showAppointmentsStateServices(accessToken: accessToken);
      emit(ShowAppointmentsStateSuccess(appointmentsStateModel: appointmentsStateModel!));
    }catch (e){
      emit(ShowAppointmentsStateFailure(errorMessage:"Try Again"));
    }
  }
}
