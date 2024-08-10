import 'dart:convert';
import 'package:scope_parent/Features/Attendance/Data/Model/AttendanceModel.dart';
import '../../../../main.dart';
import 'package:http/http.dart' as http;


class ShowAttendanceDayServices {
  String baseUrl="http://$ipServer:8000";
  Future <AttendanceModel> showAttendanceDayServices({
    required dynamic accessToken,
    required dynamic name,
    required dynamic date,
  })async{
    var request = http.Request('GET',
        Uri.parse('$baseUrl/api/get_Student_Attendance_History_for_parent_by_day'));
    request.body = json.encode({
      "student_name": name,
      "the_date": date
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
      AttendanceModel attendanceModel=AttendanceModel.fromJson(dataResponse);
      return attendanceModel;
    }
    else{
      throw Exception("The Error Is In This Request : ${response.statusCode.toString()}");
    }
  }
}


