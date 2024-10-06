import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Data/Model/EvaluationsMonthModel.dart';
import '../ChildEvaluationsView1/ContainerEvaluationsWidget.dart';
import '../ChildEvaluationsView1/ContainerNoteWidget.dart';
import '../ChildEvaluationsView1/EvaluationsTextWidget.dart';
import '../ChildEvaluationsView1/NoteTextWidget.dart';

class BoxevaluationsArchiveWidget extends StatelessWidget{
  BoxevaluationsArchiveWidget({required this.evaluationsMonthModel,required this.index});
  EvaluationsMonthModel evaluationsMonthModel;
  int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30,left: 20,right: 20),
      child:Container(
        width: 300,
        height: 1280,
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
                text: evaluationsMonthModel.date[index],
              ),
            ),
            Positioned(
              top: 70, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject:evaluationsMonthModel.subjectName[index][0],
                evaluation: evaluationsMonthModel.evaluation[index][0],
              ),
            ),
            Positioned(
              top: 160, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject:evaluationsMonthModel.subjectName[index][1],
                evaluation: evaluationsMonthModel.evaluation[index][1],
              ),
            ),
            Positioned(
              top: 250, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject:evaluationsMonthModel.subjectName[index][2],
                evaluation:evaluationsMonthModel.evaluation[index][2],
              ),
            ),
            Positioned(
              top: 340, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject: evaluationsMonthModel.subjectName[index][3],
                evaluation:evaluationsMonthModel.evaluation[index][3],
              ),
            ),
            Positioned(
              top: 430, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject:evaluationsMonthModel.subjectName[index][4],
                evaluation:evaluationsMonthModel.evaluation[index][4],
              ),
            ),
            Positioned(
              top: 520, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject:evaluationsMonthModel.subjectName[index][5],
                evaluation:evaluationsMonthModel.evaluation[index][5],
              ),
            ),
            Positioned(
              top: 610, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject:evaluationsMonthModel.subjectName[index][6],
                evaluation:evaluationsMonthModel.evaluation[index][6],
              ),
            ),
            Positioned(
              top: 700, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject : evaluationsMonthModel.subjectName[index][7],
                evaluation: evaluationsMonthModel.evaluation[index][7],
              ),
            ),
            Positioned(
              top: 790, left: 20, right: 20,
              child: ContainerEvaluationsWidget(
                subject : evaluationsMonthModel.subjectName[index][8],
                evaluation: evaluationsMonthModel.evaluation[index][8],
              ),
            ),
            Positioned(
              top:875, left:30,right: 30,
              child:NoteTextWidget(text: LocaleKeys.Teacher_Note.tr()),
            ),
            Positioned(
              top: 910, left: 20, right: 20,
              child:ContainerNoteWidget(
                note: evaluationsMonthModel.noteTeachers[index],
              ),
            ),
            Positioned(
              top:1020, left:30,right: 30,
              child:NoteTextWidget(text: LocaleKeys.Manager_Note.tr()),
            ),
            evaluationsMonthModel.noteAdmins[index]!=null?
            Positioned(
              top: 1060, left: 20, right: 20,
              child: ContainerNoteWidget(
                note: evaluationsMonthModel.noteAdmins[index],
              ),
            ): Positioned(
              top: 1060, left: 20, right: 20,
              child: ContainerNoteWidget(
                note:  "There Is No Note For Manager",
              ),
            ),
            Positioned(
              top: 1180, left: 20, right: 20,
              child: Container(
                height: 55, width: 350,
                padding: const EdgeInsets.only(top: 10,left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow:const [
                    BoxShadow(
                      color:  Color(0xFFAC8FCF),
                      blurRadius: 10,
                      offset:  Offset(2,2),
                    ),
                  ],
                ),
                child:Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child:EvaluationsTextWidget(
                        text: LocaleKeys.Total_Evaluation.tr(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:2,right:2),
                      child:EvaluationsTextWidget(
                        text: evaluationsMonthModel.weeklyEvaluation[index] ,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
