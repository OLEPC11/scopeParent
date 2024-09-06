part of 'ShowRegistrationRequestStateCubit.dart';

@immutable
sealed class ShowRegistrationRequestStateState {}

final class ShowRegistrationRequestStateInitial extends ShowRegistrationRequestStateState {}
class ShowRegistrationRequestStateLoading extends ShowRegistrationRequestStateState {}
class ShowRegistrationRequestStateSuccess extends ShowRegistrationRequestStateState {
  List<RegistrationRequestStateModel> registrationRequestStateModel;
  ShowRegistrationRequestStateSuccess({required this.registrationRequestStateModel});
}
class ShowRegistrationRequestStateFailure extends ShowRegistrationRequestStateState {
  String errorMessage;
  ShowRegistrationRequestStateFailure({required this.errorMessage});
}