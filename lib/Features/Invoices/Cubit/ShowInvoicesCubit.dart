import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/Invoices/Data/Model/InvoicesModel.dart';
import 'package:scope_parent/Features/Invoices/Data/Repo/ShowInvoicesDetailsServices.dart';

part 'ShowInvoicesState.dart';

class ShowInvoicesCubit extends Cubit<ShowInvoicesState> {
  ShowInvoicesCubit() : super(ShowInvoicesInitial());

  dynamic childId;
  dynamic accessToken;
  List<InvoicesModel> invoicesModel=[];
  void showInvoicesServices ({
    required dynamic accessToken,
    required dynamic childId,
  }) async{
    emit(ShowInvoicesLoading());
    try{
      invoicesModel =await ShowInvoicesDetailsServices().showInvoicesDetailsServices(
        accessToken: accessToken,
        childId: childId,
      );
      emit(ShowInvoicesSuccess(invoicesModel: invoicesModel));
    }catch (e){
      emit(ShowInvoicesFailure(errorMessage:"Try Again"));
    }
  }
}
