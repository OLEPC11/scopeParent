class ChildModel{
  dynamic childId;
  dynamic childName;
  dynamic childCategory;
  dynamic childImageName;
  dynamic childImagePath;
  ChildModel({
    required this.childId,
    required this.childName,
    required this.childCategory,
    required this.childImageName,
    required this.childImagePath
  });
  factory ChildModel.fromJson( dynamic jsonData){
    return ChildModel(
      childId:jsonData["id"],
      childName:jsonData["name"],
      childCategory: jsonData["category"],
      childImageName: jsonData["images"][0]["name"],
      childImagePath:jsonData["images"][0]["path"],
    );
  }
}

