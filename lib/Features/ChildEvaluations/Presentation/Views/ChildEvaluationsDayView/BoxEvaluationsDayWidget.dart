import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scope_parent/Features/ChildEvaluations/Data/Model/EvaluationsDayModel.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../ChildEvaluationsView/ContainerEvaluationsWidget.dart';
import '../ChildEvaluationsView/ContainerNoteWidget.dart';
import '../ChildEvaluationsView/NoteTextWidget.dart';

class BoxEvaluationsDayWidget extends StatelessWidget{
  BoxEvaluationsDayWidget({
    required this.index,
    required this.evaluationsDayModel,
  });
  EvaluationsDayModel evaluationsDayModel;
  int index;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
      //color: const Color(0xFF7DA4FF),
      child: Column(
        children:[
          Padding(
            padding: const EdgeInsets.only(top:10, left:20,right: 120),
            child:NoteTextWidget(
              text: "Note For ${evaluationsDayModel.date[index]} :",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20, left:20,right: 210),
            child:NoteTextWidget(text: "${LocaleKeys.Teacher_Note.tr()}:"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
            child: ContainerNoteWidget(
              note:evaluationsDayModel.noteTeachers,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10, left:20,right: 210),
            child:NoteTextWidget(text:"${LocaleKeys.Manager_Note.tr()}:"),
          ),
          evaluationsDayModel.noteAdmins!=null?
          Padding(
            padding: const EdgeInsets.only(top:20, left: 10,right: 10),
            child: ContainerNoteWidget(
              note:  evaluationsDayModel.noteAdmins,
            ),
          ):
          Padding(
            padding: const EdgeInsets.only(top:20, left: 10,right: 10),
            child: ContainerNoteWidget(
              note:  "There Is No Note For Manager",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only( top:13, left:20,right: 60),
            child:NoteTextWidget(
              text: "Evaluations For ${evaluationsDayModel.date[index]} :",
            ),
          ),
          Container(
            width: 350,
            decoration:  BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child:Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount:evaluationsDayModel.evaluation.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context,index) {
                  return ContainerEvaluationsWidget(
                    subject: evaluationsDayModel.subjectName[index],
                    evaluation: evaluationsDayModel.evaluation[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
