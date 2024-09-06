import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../main.dart';


class AddRecordOrderServices {
  String baseUrl="http://$ipServer:8000";
  Future <Map<String,dynamic>> addRecordOrderServices({
    required dynamic accessToken,
    required dynamic studentId,
  })async{
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/Record_student"),
    );
    request.fields.addAll({
      "student_id":"$studentId",
    });
    var  headers={
      "Accept":"application/json",
      "Authorization":"Bearer $accessToken"
    };
    request.headers.addAll(headers);

    http.StreamedResponse response=await request.send();

    if(response.statusCode==200){
      String data = await response.stream.bytesToString();
      Map<String,dynamic> dataResponse=jsonDecode(data);
      print(dataResponse);
      return dataResponse;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode}");
    }
  }
}


