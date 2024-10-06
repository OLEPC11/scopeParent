import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Homework/Data/Repo/DeleteNoteServices.dart';

part 'DeleteNoteState.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(DeleteNoteInitial());

  dynamic accessToken;
  dynamic noteId;
  void deleteNoteServices ({
    required dynamic noteId,
    required dynamic accessToken,
  }) async{
    emit(DeleteNoteLoading());
    try{
      Map<String,dynamic>deleteNote =await DeleteNoteServices().deleteNoteServices(
        noteId: noteId,
        accessToken: accessToken,
      );
      emit(DeleteNoteSuccess());
    }catch (e){
      emit(DeleteNoteFailure(errorMessage:e.toString()));
      //emit(DeleteNoteFailure(errorMessage:"Try Again"));
    }
  }
}
