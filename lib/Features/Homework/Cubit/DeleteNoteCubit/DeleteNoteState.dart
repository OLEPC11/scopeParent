part of 'DeleteNoteCubit.dart';

@immutable
sealed class DeleteNoteState {}

final class DeleteNoteInitial extends DeleteNoteState {}
class DeleteNoteLoading extends DeleteNoteState {}
class DeleteNoteSuccess extends DeleteNoteState{}
class DeleteNoteFailure extends DeleteNoteState {
  String errorMessage;
  DeleteNoteFailure({required this.errorMessage});
}