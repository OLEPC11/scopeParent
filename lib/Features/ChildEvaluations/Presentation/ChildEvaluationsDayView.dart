import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/ChildEvaluationsDayView/ChildEvaluationsViewDayBody.dart';

class ChildEvaluationsDayView extends StatefulWidget {

  @override
  State<ChildEvaluationsDayView>createState()=>_ChildEvaluationsDayViewState();

}
class _ChildEvaluationsDayViewState extends State<ChildEvaluationsDayView>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:const Color(0xFFD4E7FE) ,
        title: TextWidget(
          text: LocaleKeys.Student_Evaluations.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: "Outfit",
        ),
      ),
      body: ChildEvaluationsViewDayBody(),
    );
  }
}

