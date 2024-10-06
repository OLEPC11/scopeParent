import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Homework/Data/Repo/AddNoteServices.dart';

part 'AddNoteState.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  dynamic nameChild;
  dynamic accessToken;
  dynamic note;
  dynamic homeworkId;
  void addNoteServices ({
    required dynamic homeworkId,
    required dynamic note,
    required dynamic accessToken,
    required dynamic nameChild,
  }) async{
    emit(AddNoteLoading());
    try{
      Map<String,dynamic>addNote =await AddNoteServices().addNoteServices(
        studentName: nameChild,
        accessToken: accessToken,
        note: note,
        homeworkId: homeworkId,
      );
      emit(AddNoteSuccess());
    }catch (e){
      emit(AddNoteFailure(errorMessage:e.toString()));
      //emit(AddNoteFailure(errorMessage:"Try Again"));
    }
  }
}
