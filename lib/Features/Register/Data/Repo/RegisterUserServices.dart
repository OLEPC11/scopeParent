import 'dart:convert';
import '../../../../main.dart';
import 'package:http/http.dart' as http;
import '../Model/RegisterUserModel.dart';

class RegisterUserServices {
  String baseUrl="http://$ipServer:8000";
Future <RegisterUserModel> registerServices({
  required dynamic image,
  required dynamic firstName,
  required dynamic lastName,
  required dynamic phoneNumber,
  required dynamic password,
})async{
  var request = http.MultipartRequest(
    'POST',
    Uri.parse("$baseUrl/api/signup"),
  );
  request.fields.addAll({
    "first_name":firstName,
    "last_name":lastName,
    "phone":phoneNumber,
    "password":password,
    "role_id":"4",
  });
  var  headers={
    "Accept":"application/json",
  };
  request.files.add(await http.MultipartFile.fromPath(
    'image',image!.path,
  ));
  request.headers.addAll(headers);

  http.StreamedResponse response=await request.send();

  if(response.statusCode==200||response.statusCode == 201){
    String data = await response.stream.bytesToString();
    Map<String,dynamic> dataResponse=jsonDecode(data);
    RegisterUserModel registerUserModel=RegisterUserModel.fromJson(dataResponse);
    return registerUserModel;
  }
  else{
    throw Exception("The Error Is In This Request : ${response.statusCode}");
  }
}
}


