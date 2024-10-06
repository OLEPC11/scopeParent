class ResponseModel{
  dynamic noteId;
  dynamic date;
  dynamic subject;
  dynamic homework;
  dynamic lessonName;
  dynamic homeworkId;
  dynamic parentNote;
  dynamic teacherResponse;
  ResponseModel({
    required this.noteId,
    required this.date,
    required this.subject,
    required this.homework,
    required this.lessonName,
    required this.homeworkId,
    required this.parentNote,
    required this.teacherResponse,
  });
  factory ResponseModel.fromJson( dynamic jsonData){
    return ResponseModel(
      noteId:jsonData["id"],
      date: jsonData["created_at"],
      subject: jsonData["homework"]["subject"],
      homework: jsonData["homework"]["description"],
      lessonName:jsonData["homework"]["lesson_name"] ,
      homeworkId:jsonData["homework"]["id"] ,
      parentNote:jsonData["parent_note"]  ,
      teacherResponse: jsonData["teacher_response"],
    );
  }
}

