import 'dart:convert';
import 'package:scope_parent/Features/ChildEvaluations/Data/Model/EvaluationsMonthModel.dart';
import '../../../../main.dart';
import 'package:http/http.dart' as http;


class ShowEvaluationsMonthServices {
  String baseUrl="http://$ipServer:8000";
  Future <EvaluationsMonthModel> showEvaluationsMonthServices({
    required dynamic accessToken,
    required dynamic name,
    required dynamic category,
    required dynamic month,
    required dynamic year,
  })async{
    var request = http.Request(
        'POST',
        Uri.parse('$baseUrl/api/show__evaluationstudent_by_month_for_parent'));
    request.body = json.encode({
      "student_name": name,
      "class_name": category,
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
      print(dataResponse);
      EvaluationsMonthModel evaluationsModel=EvaluationsMonthModel.fromJson(dataResponse);
      print(1111111);
      return evaluationsModel;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode.toString()}");
    }
  }
}


