import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scope_parent/Features/ChildEvaluations/Data/Model/EvaluationsDayModel.dart';
import 'package:scope_parent/Features/ChildEvaluations/Data/Model/EvaluationsMonthModel.dart';
import '../../../../../translations/locale_keys.g.dart';
import 'ContainerEvaluationsWidget.dart';
import 'ContainerNoteWidget.dart';
import 'NoteTextWidget.dart';

class BoxEvaluationsWidget extends StatelessWidget{
  BoxEvaluationsWidget({
    required this.evaluationsModel,
    required this.index,
   // required this.evaluationsDayModel,
  });
  EvaluationsMonthModel evaluationsModel;
  int index;
  @override
  Widget build(BuildContext context) {

    return   Container(
      margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
      //color: const Color(0xFF7DA4FF),
      child: Column(
        children:[
          Padding(
            padding: const EdgeInsets.only(top:10, left:20,right: 120),
            child:NoteTextWidget(
              text: "Note For ${evaluationsModel.date[index]} :",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10, left:20,right: 210),
            child:NoteTextWidget(text:"${ LocaleKeys.Teacher_Note.tr()}:"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
            child: ContainerNoteWidget(
              note:evaluationsModel.noteTeachers[index],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10, left:20,right: 210),
            child:NoteTextWidget(text:LocaleKeys.Manager_Note.tr()),
          ),
          evaluationsModel.noteAdmins[index]!=null?
          Padding(
            padding: const EdgeInsets.only(top:10, left: 10,right: 10),
            child: ContainerNoteWidget(
              note:  evaluationsModel.noteAdmins[index],
            ),
          ):
          Padding(
            padding: const EdgeInsets.only(top:10, left: 10,right: 10),
            child: ContainerNoteWidget(
              note:  "There Is No Note For Manager",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only( top:13, left:15,right: 50,bottom: 20),
            child:NoteTextWidget(
              text: "Evaluations For ${evaluationsModel.date[index]} :",
            ),
          ),
          Container(
            width: 350,
            decoration:  BoxDecoration(
             // color:const Color(0xFFD4E7FE) ,
              borderRadius: BorderRadius.circular(30),
            ),
            child:Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount:evaluationsModel.evaluation[index].length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context,index) {
                  return ContainerEvaluationsWidget(
                    subject: evaluationsModel.subjectName[this.index][index],
                    evaluation: evaluationsModel.evaluation[this.index][index],
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
