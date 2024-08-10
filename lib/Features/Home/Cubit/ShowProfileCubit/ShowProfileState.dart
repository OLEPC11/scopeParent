part of 'ShowProfileCubit.dart';

@immutable
abstract class ShowProfileState {}

final class ShowProfileInitial extends ShowProfileState {}
class ShowProfileLoading extends ShowProfileState {}
class ShowProfileSuccess extends ShowProfileState {
  ProfileUserModel profileUserModel;
  ShowProfileSuccess({required this.profileUserModel});
}
class ShowProfileFailure extends ShowProfileState {
  String errorMessage;
  ShowProfileFailure({required this.errorMessage});
}

