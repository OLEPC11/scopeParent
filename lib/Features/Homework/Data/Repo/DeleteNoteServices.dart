import 'dart:convert';
import '../../../../main.dart';
import 'package:http/http.dart' as http;

class DeleteNoteServices {
  String baseUrl="http://$ipServer:8000";
  Future <Map<String,dynamic>> deleteNoteServices({
    required dynamic noteId,
    required dynamic accessToken,
  })async{
    var request = http.Request('DELETE',
        Uri.parse('$baseUrl/api/delete_parent_note/$noteId'));
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


