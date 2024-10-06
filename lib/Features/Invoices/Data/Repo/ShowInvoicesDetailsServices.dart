import 'dart:convert';
import 'package:scope_parent/Features/Invoices/Data/Model/InvoicesModel.dart';
import '../../../../main.dart';
import 'package:http/http.dart' as http;

class ShowInvoicesDetailsServices {
  String baseUrl="http://$ipServer:8000";
  Future <List<InvoicesModel>> showInvoicesDetailsServices({
    required dynamic accessToken,
    required dynamic childId,
  })async{
  var request = http.MultipartRequest(
    'GET',
    Uri.parse('$baseUrl/api/get_invoices_for_parent/$childId'),
  );
  var  headers={
    "Accept":"application/json",
    "Authorization":"Bearer $accessToken"
  };
  request.headers.addAll(headers);

  http.StreamedResponse response=await request.send();

  if(response.statusCode==200||response.statusCode == 201){
    String data = await response.stream.bytesToString();
    Map<String,dynamic> dataResponse=jsonDecode(data);
    List<dynamic>data1=dataResponse["student"]["invoices"];
    List<InvoicesModel> invoicesList=[];
    for(int i=0;i<data1.length;i++){
      invoicesList.add(
          InvoicesModel.fromJson(data1[i]));
    }
    return invoicesList;
  }
  else{
    throw Exception("The Error Is In This Request : ${response.statusCode.toString()}");
  }
  }
}


