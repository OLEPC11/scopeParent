import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scope_parent/Features/Appointment/Data/Model/AppointmentsStateModel.dart';
import '../../../../main.dart';
import '../Model/RegistrationRequestStateModel.dart';


class ShowRegistrationRequestStateServices {
  String baseUrl="http://$ipServer:8000";
  Future <List<RegistrationRequestStateModel>> showRegistrationRequestStateServices({
    required dynamic accessToken,
  })async{
    var request = http.MultipartRequest(
      'GET',
      Uri.parse("$baseUrl/api/show_record_for_parent"),
    );
    var  headers={
      "Accept":"application/json",
      "Authorization":"Bearer $accessToken"
    };
    request.headers.addAll(headers);

    http.StreamedResponse response=await request.send();

    if(response.statusCode==200||response.statusCode == 201){
      String data = await response.stream.bytesToString();
      List<dynamic> dataResponse=jsonDecode(data);
      List<RegistrationRequestStateModel> registrationRequestStateModelList=[];
      for(int i=0;i<dataResponse.length;i++){
        registrationRequestStateModelList.add(
            RegistrationRequestStateModel.fromJson(dataResponse[i]));
      }
      return registrationRequestStateModelList;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode}");
    }
  }
}


