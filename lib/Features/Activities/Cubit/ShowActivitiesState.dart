part of 'ShowActivitiesCubit.dart';

@immutable
sealed class ShowActivitiesState {}

final class ShowActivitiesInitial extends ShowActivitiesState {}
class ShowActivitiesLoading extends ShowActivitiesState {}
class ShowActivitiesSuccess extends ShowActivitiesState {
  List<ActivitiesModel> activitiesModel ;
  ShowActivitiesSuccess({required this.activitiesModel});
}
class ShowActivitiesFailure extends ShowActivitiesState {
  String errorMessage;
  ShowActivitiesFailure({required this.errorMessage});
}