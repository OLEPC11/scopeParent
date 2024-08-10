class InvoicesModel{
  dynamic invoiceId;
  dynamic invoiceDate;
  dynamic invoiceAmount;
  InvoicesModel({
    required this.invoiceId,
    required this.invoiceDate,
    required this.invoiceAmount,
  });
  factory InvoicesModel.fromJson( dynamic jsonData){
    return InvoicesModel(
      invoiceId:jsonData["id"],
      invoiceDate:jsonData["created_at"],
      invoiceAmount: jsonData["amount"],
    );
  }
}

