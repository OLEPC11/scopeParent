part of 'AddNoteCubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}
class AddNoteLoading extends AddNoteState {}
class AddNoteSuccess extends AddNoteState{}
class AddNoteFailure extends AddNoteState {
  String errorMessage;
  AddNoteFailure({required this.errorMessage});
}