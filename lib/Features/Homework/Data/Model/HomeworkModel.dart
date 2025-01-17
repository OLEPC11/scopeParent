class HomeworkModel{
  dynamic day;
  dynamic date;
  dynamic categoryId;
  dynamic subject;
  dynamic homework;

  HomeworkModel({
    required this.day,
    required this.date,
    required this.categoryId,
    required this.subject,
    required this.homework,
  });
  factory HomeworkModel.fromJson( dynamic jsonData){
    return HomeworkModel(
      day: jsonData["day"],
      date: jsonData["date"],
      categoryId: jsonData["category"],
      subject: jsonData["subject"],
      homework: jsonData["homework"],
    );
  }
}

