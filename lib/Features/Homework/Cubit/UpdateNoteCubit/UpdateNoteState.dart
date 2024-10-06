part of 'UpdateNoteCubit.dart';

@immutable
sealed class UpdateNoteState {}

final class UpdateNoteInitial extends UpdateNoteState {}
class UpdateNoteLoading extends UpdateNoteState {}
class UpdateNoteSuccess extends UpdateNoteState{}
class UpdateNoteFailure extends UpdateNoteState {
  String errorMessage;
  UpdateNoteFailure({required this.errorMessage});
}