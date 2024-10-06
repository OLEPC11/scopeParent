import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scope_parent/Features/Home/Data/Model/ProfileUserModel.dart';
import '../../../../main.dart';


class ShowProfileServices {
  String baseUrl="http://$ipServer:8000";
  Future <ProfileUserModel> showProfileServices({
    required dynamic accessToken,
  })async{
    var request = http.MultipartRequest(
      'GET',
      Uri.parse("$baseUrl/api/profile"),
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
      ProfileUserModel profileUserModel=ProfileUserModel.fromJson(dataResponse);
      return profileUserModel;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode}");
    }
  }
}


