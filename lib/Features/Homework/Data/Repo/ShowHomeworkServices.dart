import 'dart:convert';
import '../../../../main.dart';
import 'package:http/http.dart' as http;
import '../Model/HomeworkModel.dart';


class ShowHomeworkServices {
  String baseUrl="http://$ipServer:8000";
  Future <List<HomeworkModel>> showHomeworkServices({
    required dynamic day,
    required dynamic month,
    required dynamic year,
    required dynamic categoryId,
  })async{
    var request = http.Request('GET',
        Uri.parse('$baseUrl/api/get_homework/$categoryId'));
    request.body = json.encode({
      "day": "$day",
      "month":"$month",
      "year": "$year"
    });
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if(response.statusCode==200){
      String data = await response.stream.bytesToString();
      Map<String,dynamic> dataResponse=jsonDecode(data);
      List<dynamic>data1=dataResponse["data"];
      List<HomeworkModel> homeworkModelList=[];
      for(int i=0;i<data1.length;i++){
        homeworkModelList.add(
            HomeworkModel.fromJson(data1[i]));
      }
      return homeworkModelList;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode.toString()}");
    }
  }
}


