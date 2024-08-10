part of 'EditProfileCubit.dart';

@immutable
abstract class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}
class EditProfileLoading extends EditProfileState {}
class EditProfileSuccess extends EditProfileState {}
class EditProfileFailure extends EditProfileState {
  String errorMessage;
  EditProfileFailure({required this.errorMessage});
}