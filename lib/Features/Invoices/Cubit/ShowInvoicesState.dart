part of 'ShowInvoicesCubit.dart';

@immutable
sealed class ShowInvoicesState {}

final class ShowInvoicesInitial extends ShowInvoicesState {}
class ShowInvoicesLoading extends ShowInvoicesState {}
class ShowInvoicesSuccess extends ShowInvoicesState {
  List<InvoicesModel> invoicesModel;
  ShowInvoicesSuccess({required this.invoicesModel});
}
class ShowInvoicesFailure extends ShowInvoicesState {
  String errorMessage;
  ShowInvoicesFailure({required this.errorMessage});
}
