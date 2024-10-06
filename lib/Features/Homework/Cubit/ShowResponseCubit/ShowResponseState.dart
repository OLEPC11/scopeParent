part of 'ShowResponseCubit.dart';

@immutable
sealed class ShowResponseState {}

final class ShowResponseInitial extends ShowResponseState {}
class ShowResponseLoading extends ShowResponseState {}
class ShowResponseSuccess extends ShowResponseState {
  List<ResponseModel> responseModel ;
  ShowResponseSuccess({required this.responseModel});
}
class ShowResponseFailure extends ShowResponseState {
  String errorMessage;
  ShowResponseFailure({required this.errorMessage});
}