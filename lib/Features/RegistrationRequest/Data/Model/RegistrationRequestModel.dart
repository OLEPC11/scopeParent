class RegistrationRequestModel{
  dynamic studentId;
  RegistrationRequestModel({
    required this.studentId,
  });
  factory RegistrationRequestModel.fromJson( dynamic jsonData){
    return RegistrationRequestModel(
      studentId: jsonData["student"]["id"],
    );
  }
}