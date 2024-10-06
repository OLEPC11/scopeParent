import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../main.dart';


class LogoutServices {
  String baseUrl="http://$ipServer:8000";
  Future <Map<String,dynamic>> logoutServices({
    required dynamic accessToken,
  })async{
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/logout"),
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
      return dataResponse;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode}");
    }
  }
}


