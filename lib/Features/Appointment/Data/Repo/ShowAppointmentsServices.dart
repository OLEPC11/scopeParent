import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scope_parent/Features/Appointment/Data/Model/AppointmentsModel.dart';
import '../../../../main.dart';


class ShowAppointmentsServices {
  String baseUrl="http://$ipServer:8000";
  Future <List<AppointmentsModel>> showAppointmentsServices()async{
    var request = http.MultipartRequest(
      'GET',
      Uri.parse("$baseUrl/api/show_appointments/available"),
    );
    var  headers={
      "Accept":"application/json",
    };
    request.headers.addAll(headers);

    http.StreamedResponse response=await request.send();

    if(response.statusCode==200){
      String data = await response.stream.bytesToString();
      Map<String,dynamic> dataResponse=jsonDecode(data);
      List<dynamic>data1=dataResponse["data"];
      List<AppointmentsModel> appointmentsModelList=[];
      for(int i=0;i<data1.length;i++){
        appointmentsModelList.add(
            AppointmentsModel.fromJson(data1[i]));
      }
      return appointmentsModelList;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode}");
    }
  }
}


