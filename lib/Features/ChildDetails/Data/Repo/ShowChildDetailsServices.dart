import 'dart:convert';
import 'package:scope_parent/Features/ChildDetails/Data/Model/ChildDetailsModel.dart';
import '../../../../main.dart';
import 'package:http/http.dart' as http;


class ShowChildDetailsServices {
  String baseUrl="http://$ipServer:8000";
  Future <ChildDetailsModel> showChildDetailsServices({
    required dynamic childId,
  })async{
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('$baseUrl/api/show_student/$childId'),
  );
  var  headers={
    "Accept":"application/json",
  };
  request.headers.addAll(headers);

  http.StreamedResponse response=await request.send();

  if(response.statusCode==200){
    String data = await response.stream.bytesToString();
    Map<String,dynamic> dataResponse=jsonDecode(data);
    ChildDetailsModel childDetailsModel=ChildDetailsModel.fromJson(dataResponse);
    return childDetailsModel;
  }
  else{
    throw Exception("The Error Is In This Request : ${response.statusCode.toString()}");
  }
  }
}


