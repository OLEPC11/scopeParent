import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Appointment/Data/Repo/AddReservationServices.dart';

part 'AddReservationState.dart';

class AddReservationCubit extends Cubit<AddReservationState> {
  AddReservationCubit() : super(AddReservationInitial());
  dynamic appointmentId;
  dynamic description;
  dynamic accessToken;
  void addReservationServices ({
    required dynamic appointmentId,
    required dynamic description,
    required dynamic accessToken,

  }) async{
    emit(AddReservationLoading());
    try{
      Map<String,dynamic>logout =await AddReservationServices().addReservationServices(
        appointmentId: appointmentId,
        description: description,
        accessToken: accessToken,
      );
      emit(AddReservationSuccess());
    }catch (e){
      emit(AddReservationFailure(errorMessage:e.toString()));
      //emit(AddReservationFailure(errorMessage:"Try Again"));
    }
  }
}
