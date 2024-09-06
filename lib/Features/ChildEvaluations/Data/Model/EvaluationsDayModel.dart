class EvaluationsDayModel {
  dynamic childName;
  dynamic childCategory;
  List<dynamic> evaluation;
  List<dynamic> subjectName;
  List<dynamic> date;
  dynamic noteTeachers;
  dynamic noteAdmins;
  dynamic childImageName;
  dynamic childImagePath;

  EvaluationsDayModel({
    required this.childName,
    required this.childCategory,
    required this.evaluation,
    required this.subjectName,
    required this.date,
    required this.noteTeachers,
    required this.noteAdmins,
    required this.childImageName,
    required this.childImagePath,
  });

  factory EvaluationsDayModel.fromJson(dynamic jsonData) {
    var evaluationData = jsonData["evaluations"] as List;
    List<dynamic> evaluation = [];
    List<dynamic> subjectName = [];
    List<dynamic> dates=[];

    for (int i=0;i<evaluationData.length;i++) {
      dates.add(evaluationData[i]["created_at"]);
      evaluation.add(evaluationData[i]["evaluation"]);
      subjectName.add(evaluationData[i]["subject_name"]);
    }

    return EvaluationsDayModel(
      childName: jsonData["student_name"],
      childCategory: jsonData["class_name"],
      evaluation: evaluation,
      subjectName: subjectName,
      noteTeachers: jsonData["note_teacher"],
      noteAdmins: jsonData["note_admin"],
      date: dates,
      childImageName: jsonData["images"][0]["name"],
      childImagePath: jsonData["images"][0]["path"],
    );
  }
}

