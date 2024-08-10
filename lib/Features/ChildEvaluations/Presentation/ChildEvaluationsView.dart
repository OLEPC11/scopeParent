import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/ChildEvaluationsView/ChildEvaluationsViewBody.dart';

class ChildEvaluationsView extends StatefulWidget {

  @override
  State<ChildEvaluationsView>createState()=>_ChildEvaluationsViewState();

}
class _ChildEvaluationsViewState extends State<ChildEvaluationsView>{

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
      body: ChildEvaluationsViewBody(),
    );
  }
}
