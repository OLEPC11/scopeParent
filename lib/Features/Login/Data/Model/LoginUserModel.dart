class LoginUserModel{
  dynamic image;
  dynamic firstName;
  dynamic lastName;
  dynamic phoneNumber;
  dynamic userId;
  dynamic roleId;
  dynamic accessToken;
  LoginUserModel({
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.userId,
    required this.roleId,
    required this.accessToken,
  });
  factory LoginUserModel.fromJson( dynamic jsonData){
    return LoginUserModel(
      image: jsonData["user"]["image"],
      firstName: jsonData["user"]["first_name"],
      lastName: jsonData["user"]["last_name"],
      phoneNumber:jsonData["user"]["phone"],
      userId:jsonData["user"]["id"],
      roleId:jsonData["user"]["role_id"] ,
      accessToken:jsonData["token"],
    );
  }
}