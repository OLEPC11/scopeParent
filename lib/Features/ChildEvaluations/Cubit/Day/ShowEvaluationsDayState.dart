part of 'ShowEvaluationsDayCubit.dart';

@immutable
sealed class ShowEvaluationsDayState {}

final class ShowEvaluationsDayInitial extends ShowEvaluationsDayState {}
class ShowEvaluationsDayLoading extends ShowEvaluationsDayState {}
class ShowEvaluationsDaySuccess extends ShowEvaluationsDayState {
  EvaluationsDayModel evaluationsDayModel ;
  ShowEvaluationsDaySuccess({required this.evaluationsDayModel,});
}
class ShowEvaluationsDayFailure extends ShowEvaluationsDayState {
  String errorMessage;
  ShowEvaluationsDayFailure({required this.errorMessage});
}