class ProfileUserModel{
  dynamic image;
  dynamic firstName;
  dynamic lastName;
  dynamic phoneNumber;
  dynamic email;
  dynamic userId;
  dynamic roleId;
  dynamic message;
  ProfileUserModel({
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.userId,
    required this.roleId,
    required this.message,
  });
  factory ProfileUserModel.fromJson( dynamic jsonData){
    return ProfileUserModel(
      image: jsonData["data"]["image"],
      firstName: jsonData["data"]["first_name"],
      lastName: jsonData["data"]["last_name"],
      phoneNumber:jsonData["data"]["phone"],
      email: jsonData["data"]["email"],
      userId:jsonData["data"]["id"],
      roleId:jsonData["data"]["role_id"] ,
      message:["message"],
    );
  }

}