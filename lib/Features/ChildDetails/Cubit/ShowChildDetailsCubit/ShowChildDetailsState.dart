part of 'ShowChildDetailsCubit.dart';

@immutable
sealed class ShowChildDetailsState {}

final class ShowChildDetailsInitial extends ShowChildDetailsState {}
class ShowChildDetailsLoading extends ShowChildDetailsState {}
class ShowChildDetailsSuccess extends ShowChildDetailsState {
  ChildDetailsModel childDetailsModel;
  ShowChildDetailsSuccess({required this.childDetailsModel});
}
class ShowChildDetailsFailure extends ShowChildDetailsState {
  String errorMessage;
  ShowChildDetailsFailure({required this.errorMessage});
}