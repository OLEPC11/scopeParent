class ActivitiesModel{
  dynamic activityId;
  dynamic activityName;
  dynamic activityDate;
  dynamic activityPost;
  List<ActivityImage> activityImages;
  ActivitiesModel({
    required this.activityId,
    required this.activityDate,
    required this.activityName,
    required this.activityPost,
    required this.activityImages,
  });
  factory ActivitiesModel.fromJson( dynamic jsonData){
    var imagesFromJson = jsonData['images'] as List;
    List<ActivityImage> imagesList = imagesFromJson.map((image) => ActivityImage.fromJson(image)).toList();
    return ActivitiesModel(
      activityId:jsonData["activity"]["id"],
      activityDate:jsonData["activity"]["date"],
      activityName: jsonData["activity"]["name"],
      activityPost: jsonData["activity"]["post"],
      activityImages:imagesList,
    );
  }
}

class ActivityImage {
  dynamic imageName;
  dynamic imagePath;

  ActivityImage({required this.imageName,required this.imagePath});
  factory ActivityImage.fromJson(dynamic json) {
    return ActivityImage(
      imageName: json["name"],
      imagePath: json["path"],
    );
  }
}
