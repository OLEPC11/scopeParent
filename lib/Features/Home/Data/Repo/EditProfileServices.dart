import 'dart:convert';
import '../../../../main.dart';
import 'package:http/http.dart' as http;

class EditProfileServices {
  String baseUrl="http://$ipServer:8000";
  Future <Map<String,dynamic>> editProfileServices({
    required dynamic image,
    dynamic firstName,
    dynamic lastName,
    dynamic phoneNumber,
    dynamic email,
    dynamic password,
    required dynamic accessToken,
  })async{
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/user_update"),
    );
    request.fields.addAll({
      "first_name":firstName,
      "last_name":lastName,
      "phone":phoneNumber,
      "email":email,
      "password":password
    });
    var  headers={
      "Accept":"application/json",
      "Authorization":"Bearer $accessToken"
    };
    request.files.add(await http.MultipartFile.fromPath(
      'image',image!.path,
    ));
    request.headers.addAll(headers);

    http.StreamedResponse response=await request.send();

    if(response.statusCode==200){
      String data = await response.stream.bytesToString();
      Map<String,dynamic> dataResponse=jsonDecode(data);
      return dataResponse;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode}");
    }
  }
  Future <Map<String,dynamic>> editProfileServicesWithoutImage({
    dynamic firstName,
    dynamic lastName,
    dynamic phoneNumber,
    dynamic email,
    dynamic password,
    required dynamic accessToken,
  })async{
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/user_update"),
    );
    request.fields.addAll({
      "first_name":firstName,
      "last_name":lastName,
      "phone":phoneNumber,
      "email":email,
      "password":password
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
      return dataResponse;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode}");
    }
  }
}


