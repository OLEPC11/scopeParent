import 'dart:convert';
import '../../../../main.dart';
import 'package:http/http.dart' as http;

class UpdateNoteServices {
  String baseUrl="http://$ipServer:8000";
  Future <Map<String,dynamic>> updateNoteServices({
    required dynamic noteId,
    required dynamic note,
    required dynamic accessToken,
  })async{
    var request = http.Request('POST',
        Uri.parse('$baseUrl/api/update_parent_note/$noteId'));
    request.body = json.encode({
      "parent_note": note,
    });
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "Authorization":"Bearer $accessToken"
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if(response.statusCode==200||response.statusCode==201){
      String data = await response.stream.bytesToString();
      Map<String,dynamic> dataResponse=jsonDecode(data);
      return dataResponse;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode.toString()}");
    }
  }
}


