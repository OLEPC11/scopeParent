import 'dart:convert';
import 'package:scope_parent/Features/Login/Data/Model/LoginUserModel.dart';
import '../../../../main.dart';
import 'package:http/http.dart' as http;


class LoginUserServices {
  String baseUrl="http://$ipServer:8000";
  Future <LoginUserModel> loginServices({
    required dynamic phoneNumber,
    required dynamic password,
  })async{
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/login"),
    );
    request.fields.addAll({
      "phone":phoneNumber,
      "password":password,
    });
    var  headers={
      "Accept":"application/json",
    };
    request.headers.addAll(headers);

    http.StreamedResponse response=await request.send();
    if(response.statusCode==200||response.statusCode == 201){
      String data = await response.stream.bytesToString();
      Map<String,dynamic> dataResponse=jsonDecode(data);
      LoginUserModel loginUserModel=LoginUserModel.fromJson(dataResponse);
      return loginUserModel;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode}");
    }
  }
}


