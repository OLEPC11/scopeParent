import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Appointment/Data/Model/AppointmentsModel.dart';
import 'package:scope_parent/Features/Appointment/Data/Repo/ShowAppointmentsServices.dart';

part 'ShowAppointmentState.dart';

class ShowAppointmentCubit extends Cubit<ShowAppointmentState> {
  ShowAppointmentCubit() : super(ShowAppointmentInitial());

  List<AppointmentsModel>? appointmentsModel;
  void showAppointmentServices () async{
    emit(ShowAppointmentLoading());
    try{
      appointmentsModel =await ShowAppointmentsServices().showAppointmentsServices();
      emit(ShowAppointmentSuccess(appointmentsModel: appointmentsModel!));
    }catch (e){
      emit(ShowAppointmentFailure(errorMessage:"Try Again"));
    }
  }
}
