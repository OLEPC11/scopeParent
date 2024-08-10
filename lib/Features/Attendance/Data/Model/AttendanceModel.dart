class AttendanceModel{
  dynamic childName;
  dynamic childCategory;
  List<dynamic> dates;
  List<dynamic> statuses;
  dynamic childImageName;
  dynamic childImagePath;

  AttendanceModel({
    required this.childName,
    required this.childCategory,
    required this.dates,
    required this.statuses,
    required this.childImageName,
    required this.childImagePath
  });
  factory AttendanceModel.fromJson( dynamic jsonData){
    var attendanceHistory = jsonData['student_attendance_history'] as List;
    List<dynamic> dates = [];
    List<String> statuses = [];
    for (var item in attendanceHistory) {
      dates.add(item['the_date']);
      statuses.add(item['status']);
    }
    return AttendanceModel(
      childName:jsonData["student"]["name"],
      childCategory: jsonData["student"]["category_name"],
      dates:dates,
      statuses: statuses,
      childImageName: jsonData["student"]["images"][0]["name"],
      childImagePath:jsonData["student"]["images"][0]["path"],
    );
  }
}

