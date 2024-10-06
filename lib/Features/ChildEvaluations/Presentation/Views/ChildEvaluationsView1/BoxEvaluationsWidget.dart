import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scope_parent/Features/ChildEvaluations/Data/Model/EvaluationsDayModel.dart';
import '../../../../../translations/locale_keys.g.dart';
import 'ContainerEvaluationsWidget.dart';
import 'ContainerNoteWidget.dart';
import 'NoteTextWidget.dart';

class BoxEvaluationsWidget extends StatelessWidget{
  BoxEvaluationsWidget({required this.evaluationsDayModel});
  EvaluationsDayModel evaluationsDayModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30,left: 20,right: 20),
      child:Container(
        width: 300,
        height: 1200,
        decoration:  BoxDecoration(
          color: const Color(0xFF3B3D6D) ,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            const Positioned(
              top:20, left:40,
              child:Icon(
                Icons.calendar_month,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
            ),
            Positioned(
              top:13, left:80,
              child:NoteTextWidget(
                text: evaluationsDayModel.date[0],
              ),
            ),
            Positioned(
              top: 70, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject:evaluationsDayModel.subjectName[0],
                evaluation: evaluationsDayModel.evaluation[0],
              ),
            ),

            Positioned(
              top: 160, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject: evaluationsDayModel.subjectName[1],
                evaluation: evaluationsDayModel.evaluation[1],
              ),
            ),
            Positioned(
              top: 250, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject: evaluationsDayModel.subjectName[2],
                evaluation:evaluationsDayModel.evaluation[2],
              ),
            ),
            Positioned(
              top: 340, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject: evaluationsDayModel.subjectName[3],
                evaluation: evaluationsDayModel.evaluation[3],
              ),
            ),
            Positioned(
              top: 430, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject: evaluationsDayModel.subjectName[4],
                evaluation:evaluationsDayModel.evaluation[4],
              ),
            ),
            Positioned(
              top: 520, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject:evaluationsDayModel.subjectName[5],
                evaluation: evaluationsDayModel.evaluation[5],
              ),
            ),
            Positioned(
              top: 610, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject: evaluationsDayModel.subjectName[6],
                evaluation: evaluationsDayModel.evaluation[6],
              ),
            ),
            Positioned(
              top: 700, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject : evaluationsDayModel.subjectName[7],
                evaluation: evaluationsDayModel.evaluation[7],
              ),
            ),
            Positioned(
              top: 790, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject : evaluationsDayModel.subjectName[8],
                evaluation: evaluationsDayModel.evaluation[8],
              ),
            ),
            Positioned(
              top:875, left:30,right: 30,
              child:NoteTextWidget(text: LocaleKeys.Teacher_Note.tr()),
            ),
            Positioned(
              top: 910, left: 20, right: 20,
              child:ContainerNoteWidget(
                note: evaluationsDayModel.noteTeachers,
              ),
            ),
            Positioned(
              top:1020, left:30,right: 30,
              child:NoteTextWidget(text: LocaleKeys.Manager_Note.tr()),
            ),
            evaluationsDayModel.noteAdmins!=null?
            Positioned(
              top: 1060, left: 20, right: 20,
              child: ContainerNoteWidget(
                note: evaluationsDayModel.noteAdmins,
              ),
            ): Positioned(
              top: 1060, left: 20, right: 20,
              child: ContainerNoteWidget(
                note:  "There Is No Note For Manager",
              ),
            )
          ],
        ),
      ),
    );
  }
}
