import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Homework/Data/Repo/UpdateNoteServices.dart';

part 'UpdateNoteState.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  UpdateNoteCubit() : super(UpdateNoteInitial());


  dynamic accessToken;
  dynamic note;
  dynamic noteId;
  void updateNoteServices ({
    required dynamic noteId,
    required dynamic note,
    required dynamic accessToken,
  }) async{
    emit(UpdateNoteLoading());
    try{
      Map<String,dynamic>updateNote =await UpdateNoteServices().updateNoteServices(
        noteId: noteId,
        accessToken: accessToken,
        note: note,
      );
      emit(UpdateNoteSuccess());
    }catch (e){
      emit(UpdateNoteFailure(errorMessage:e.toString()));
      //emit(UpdateNoteFailure(errorMessage:"Try Again"));
    }
  }
}
