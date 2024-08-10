import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/ChildDetails/Data/Repo/ShowChildDetailsServices.dart';
import 'package:scope_parent/Features/Invoices/Data/Repo/ShowInvoicesDetailsServices.dart';

import '../../Data/Model/ChildDetailsModel.dart';

part 'ShowChildDetailsState.dart';

class ShowChildDetailsCubit extends Cubit<ShowChildDetailsState> {
  ShowChildDetailsCubit() : super(ShowChildDetailsInitial());
  dynamic childId;
  ChildDetailsModel? childDetailsModel;
  void showChildDetailsServices ({
    required dynamic childId,
  }) async{
    emit(ShowChildDetailsLoading());
    try{
      childDetailsModel =await ShowChildDetailsServices().showChildDetailsServices(
        childId: childId,
      );
      emit(ShowChildDetailsSuccess(childDetailsModel: childDetailsModel!));
    }catch (e){
      emit(ShowChildDetailsFailure(errorMessage:"Try Again"));
    }
  }
}
