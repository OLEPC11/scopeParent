part of 'HomeworkCubit.dart';
@immutable
sealed class HomeworkState {}

final class HomeworkInitial extends HomeworkState {}
class HomeworkLoading extends HomeworkState {}
class HomeworkSuccess extends HomeworkState {
  List<HomeworkModel> homeworkModel ;
  HomeworkSuccess({required this.homeworkModel});
}
class HomeworkFailure extends HomeworkState {
  String errorMessage;
  HomeworkFailure({required this.errorMessage});
}