part of 'AddRegistrationRequestCubit.dart';

@immutable
sealed class AddRegistrationRequestState {}

final class AddRegistrationRequestInitial extends AddRegistrationRequestState {}
class AddRegistrationRequestLoading extends AddRegistrationRequestState {}
class AddRegistrationRequestSuccess extends AddRegistrationRequestState {
  RegistrationRequestModel registrationRequestModel;
  AddRegistrationRequestSuccess({required this.registrationRequestModel});
}
class AddRegistrationRequestFailure extends AddRegistrationRequestState {
  String errorMessage;
  AddRegistrationRequestFailure({required this.errorMessage});
}