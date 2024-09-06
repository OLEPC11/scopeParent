class RegisterUserModel{
  dynamic image;
  dynamic firstName;
  dynamic lastName;
  dynamic phoneNumber;
  dynamic email;
  dynamic userId;
  dynamic roleId;
  dynamic accessToken;
  RegisterUserModel({
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.userId,
    required this.roleId,
    required this.accessToken,
});
  factory RegisterUserModel.fromJson( dynamic jsonData){
    return RegisterUserModel(
      image: jsonData["user"]["image"],
      firstName: jsonData["user"]["first_name"],
      lastName: jsonData["user"]["last_name"],
      phoneNumber:jsonData["user"]["phone"],
      email: jsonData["user"]["email"],
      userId:jsonData["user"]["id"],
      roleId:jsonData["user"]["role_id"] ,
      accessToken:jsonData["access_token"],
    );
  }

}