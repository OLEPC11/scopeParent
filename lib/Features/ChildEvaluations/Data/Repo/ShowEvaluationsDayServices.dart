import 'dart:convert';
import 'package:scope_parent/Features/ChildEvaluations/Data/Model/EvaluationsMonthModel.dart';
import '../../../../main.dart';
import 'package:http/http.dart' as http;

import '../Model/EvaluationsDayModel.dart';


class ShowEvaluationsDayServices {
  String baseUrl="http://$ipServer:8000";
  Future <EvaluationsDayModel> showEvaluationsDayServices({
    required dynamic accessToken,
    required dynamic name,
    required dynamic category,
    required dynamic day,
    required dynamic month,
    required dynamic year,
  })async{
    var request = http.Request(
        'POST',
        Uri.parse('$baseUrl/api/show__evaluationstudent_by_day_for_parent'));
    request.body = json.encode({
      "student_name": name,
      "class_name": category,
      "day":"$day",
      "month":"$month",
      "year":"$year",
    });
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "Authorization":"Bearer $accessToken"
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if(response.statusCode==200){
      String data = await response.stream.bytesToString();
      Map<String,dynamic> dataResponse=jsonDecode(data);
      EvaluationsDayModel evaluationsModel=EvaluationsDayModel.fromJson(dataResponse);
      return evaluationsModel;

    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode.toString()}");
    }
  }
}


