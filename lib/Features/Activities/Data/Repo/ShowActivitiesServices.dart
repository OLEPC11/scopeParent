import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scope_parent/Features/Activities/Data/Model/ActivitiesModel.dart';
import '../../../../main.dart';


class ShowActivitiesServices {
  String baseUrl="http://$ipServer:8000";
  Future <List<ActivitiesModel>> showActivitiesServices()async{
    var request = http.MultipartRequest(
      'GET',
      Uri.parse("$baseUrl/api/show_all_activity"),
    );
    var  headers={
      "Accept":"application/json",
    };
    request.headers.addAll(headers);

    http.StreamedResponse response=await request.send();

    if(response.statusCode==200||response.statusCode == 201){
      String data = await response.stream.bytesToString();
      List<dynamic> dataResponse=jsonDecode(data);
      List<ActivitiesModel> activitiesModelList=[];
      for(int i=0;i<dataResponse.length;i++){
        activitiesModelList.add(
            ActivitiesModel.fromJson(dataResponse[i]));
      }

      return activitiesModelList;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode}");
    }
  }
}


