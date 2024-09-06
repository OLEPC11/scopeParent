import 'dart:convert';
import '../../../../main.dart';
import 'package:http/http.dart' as http;

import '../Model/ChildModel.dart';


class ShowAllChildServices {
  String baseUrl="http://$ipServer:8000";
  Future <List<ChildModel>> showAllChildServices({
    required dynamic accessToken,
  })async{
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('$baseUrl/api/show_student_for_parent'),
  );
  var  headers={
    "Accept":"application/json",
    "Authorization":"Bearer $accessToken"
  };
  request.headers.addAll(headers);

  http.StreamedResponse response=await request.send();

  if(response.statusCode==200){
    String data = await response.stream.bytesToString();
    Map<String,dynamic> dataResponse=jsonDecode(data);
    List<dynamic>data1=dataResponse["students"];
    List<ChildModel> childModelList=[];
    for(int i=0;i<data1.length;i++){
      childModelList.add(
          ChildModel.fromJson(data1[i]));
    }
    return childModelList;
  }
  else{
    throw Exception("The Error Is In This Request : ${response.statusCode.toString()}");
  }
  }
}


