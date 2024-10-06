import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/ChildEvaluationsArchiveView/ChildEvaluationsArchiveViewBody.dart';

class ChildEvaluationsArchiveView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:const Color(0xFF3B3D6D) ,
        title: TextWidget(
          text:  LocaleKeys.Student_Evaluations_Archive.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "Outfit",
        ),
      ),
      body: ChildEvaluationsArchiveViewBody(),
    );
  }
}
