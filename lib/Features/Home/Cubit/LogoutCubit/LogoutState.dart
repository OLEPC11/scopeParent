part of 'LogoutCubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}
class LogoutLoading extends LogoutState {}
class LogoutSuccess extends LogoutState {}
class LogoutFailure extends LogoutState {
  String errorMessage;
  LogoutFailure({required this.errorMessage});
}