part of 'ShowAllChildCubit.dart';

@immutable
sealed class ShowAllChildState {}

final class ShowAllChildInitial extends ShowAllChildState {}
class ShowAllChildLoading extends ShowAllChildState {}
class ShowAllChildSuccess extends ShowAllChildState {
  List<ChildModel> childModelList;
  ShowAllChildSuccess({required this.childModelList});
}
class ShowAllChildFailure extends ShowAllChildState {
  String errorMessage;
  ShowAllChildFailure({required this.errorMessage});
}