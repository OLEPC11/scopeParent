part of 'ShowEvaluationsMonthCubit.dart';

@immutable
sealed class ShowEvaluationsMonthState {}

final class ShowEvaluationsMonthInitial extends ShowEvaluationsMonthState {}
class ShowEvaluationsMonthLoading extends ShowEvaluationsMonthState {}
class ShowEvaluationsMonthSuccess extends ShowEvaluationsMonthState {
  EvaluationsMonthModel evaluationsMonthModel ;
  ShowEvaluationsMonthSuccess({required this.evaluationsMonthModel,});
}
class ShowEvaluationsMonthFailure extends ShowEvaluationsMonthState {
  String errorMessage;
  ShowEvaluationsMonthFailure({required this.errorMessage});
}