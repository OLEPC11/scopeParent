import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/ShowResponsesView/ShowResponsesViewBody.dart';


class ShowResponsesView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF3B3D6D) ,
        title: TextWidget(
          text:"Responses",
          color:const Color(0xFF7DA4FF),
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily:"Outfit",
        ),
      ),
      backgroundColor:Colors.white,
      body:ShowResponsesViewBody(),
    );
  }
}
