class RegistrationRequestStateModel{
  dynamic studentId;
  dynamic date;
  dynamic studentName;
  dynamic status;
  RegistrationRequestStateModel({
    required this.studentId,
    required this.studentName,
    required this.date,
    required this.status,
  });
  factory RegistrationRequestStateModel.fromJson( dynamic jsonData){
    return RegistrationRequestStateModel(
      studentId:jsonData["student_id"],
      studentName:jsonData["student_name"] ,
      date: jsonData["created_at"],
      status: jsonData["status"],
    );
  }
}