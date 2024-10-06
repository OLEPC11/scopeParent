import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import '../../../../main.dart';
import '../Model/ResponseModel.dart';


class ShowResponsesForHomeworkEnteredDayServices {
  String baseUrl="http://$ipServer:8000";
  Future <List<ResponseModel>> showResponsesForHomeworkEnteredDayServices({
    required dynamic accessToken,
    required dynamic studentName,
    required dynamic day,
    required dynamic month,
    required dynamic year,
  })async{
    var request = http.Request(
      'POST',
      Uri.parse("$baseUrl/api/get_parent_note_for_parent"),
    );
    request.body = json.encode({
      "student_name":studentName,
      "day":day,
      "month":month,
      "year":year
    });
    var  headers={
      "Accept":"application/json",
      'Content-Type': 'application/json',
      "Authorization":"Bearer $accessToken"
    };
    request.headers.addAll(headers);

    http.StreamedResponse response=await request.send();

    if(response.statusCode==200||response.statusCode == 201){
      String data = await response.stream.bytesToString();
      Map<String,dynamic> dataResponse=jsonDecode(data);
      List<dynamic>data1=dataResponse["data"];
      List<ResponseModel> responseModelList=[];
      for(int i=0;i<data1.length;i++){
        responseModelList.add(
            ResponseModel.fromJson(data1[i]));
      }
      return responseModelList;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode}");
    }
  }
}


