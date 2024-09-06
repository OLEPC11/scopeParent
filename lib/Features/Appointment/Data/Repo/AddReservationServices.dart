import 'dart:convert';
import '../../../../main.dart';
import 'package:http/http.dart' as http;


class AddReservationServices {
  String baseUrl="http://$ipServer:8000";
  Future <Map<String,dynamic>> addReservationServices({
    required String appointmentId,
    required dynamic description,
    required dynamic accessToken,
  })async{
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/add_reservation"),
    );
    request.fields.addAll({
      "appointment_id":appointmentId,
      "description":description,
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


