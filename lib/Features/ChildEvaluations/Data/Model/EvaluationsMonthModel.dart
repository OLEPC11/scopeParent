class EvaluationsMonthModel {
  dynamic childName;
  dynamic childCategory;
  dynamic numberOfDay;
  List<List<dynamic>> evaluation;
  List<List<dynamic>> subjectName;
  List<dynamic> date;
  List<dynamic> noteTeachers;
  List<dynamic> noteAdmins;
  List<dynamic> weeklyEvaluation;
  dynamic childImageName;
  dynamic childImagePath;

  EvaluationsMonthModel({
    required this.childName,
    required this.childCategory,
    required this.numberOfDay,
    required this.evaluation,
    required this.subjectName,
    required this.date,
    required this.noteTeachers,
    required this.noteAdmins,
    required this.weeklyEvaluation,
    required this.childImageName,
    required this.childImagePath,
  });

  factory EvaluationsMonthModel.fromJson(dynamic jsonData) {
    var evaluationData = jsonData["evaluations"] as List;
    var evaluationDataWeekly = jsonData["evaluation_students"] as List;
    List<dynamic> noteTeachers = [];
    List<dynamic> noteAdmins = [];
    List<dynamic> dates = [];
    List<dynamic> weeklyEvaluationStudent = [];
    List<List<dynamic>> evaluationList = [];
    List<List<dynamic>> subjectNameList = [];

    for (var dayData in evaluationData) {
      // Process each day's data individually
      noteTeachers.add(dayData["note_teacher"]);
      noteAdmins.add(dayData["note_admin"]);
      dates.add(dayData["date"]);

      // Directly process the evaluations for this day
      List<dynamic> tempEvaluation = [];
      List<dynamic> tempSubjectName = [];
      for (var evalItem in dayData["evaluations"]) {
        tempEvaluation.add(evalItem["evaluation"]);
        tempSubjectName.add(evalItem["subject_name"]);
      }
      evaluationList.add(tempEvaluation);
      subjectNameList.add(tempSubjectName);
    }

    for (var weeklyEvaluation in evaluationDataWeekly) {
      weeklyEvaluationStudent.add(weeklyEvaluation["Weekly_Evaluation"]);
    }
    return EvaluationsMonthModel(
      childName: jsonData["student_name"],
      childCategory: jsonData["class_name"],
      numberOfDay:jsonData["evaluation_days_count"],
      evaluation: evaluationList,
      subjectName: subjectNameList,
      noteTeachers: noteTeachers,
      noteAdmins: noteAdmins,
      date: dates,
      weeklyEvaluation: weeklyEvaluationStudent,
      childImageName: jsonData["images"][0]["name"],
      childImagePath: jsonData["images"][0]["path"],
    );
  }
}

