import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scope_parent/Features/Appointment/Data/Model/AppointmentsStateModel.dart';
import '../../../../main.dart';


class ShowAppointmentsStateServices {
  String baseUrl="http://$ipServer:8000";
  Future <List<AppointmentsStateModel>> showAppointmentsStateServices({
    required dynamic accessToken,
  })async{
    var request = http.MultipartRequest(
      'GET',
      Uri.parse("$baseUrl/api/view_reservation_for_parent"),
    );
    var  headers={
      "Accept":"application/json",
      "Authorization":"Bearer $accessToken"
    };
    request.headers.addAll(headers);

    http.StreamedResponse response=await request.send();

    if(response.statusCode==200){
      String data = await response.stream.bytesToString();
      List<dynamic> dataResponse=jsonDecode(data);
      List<AppointmentsStateModel> appointmentsStateModelList=[];
      for(int i=0;i<dataResponse.length;i++){
        appointmentsStateModelList.add(
            AppointmentsStateModel.fromJson(dataResponse[i]));
      }
      return appointmentsStateModelList;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode}");
    }
  }
}


