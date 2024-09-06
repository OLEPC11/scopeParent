import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../translations/locale_keys.g.dart';
import 'EvaluationsTextWidget.dart';


class ContainerEvaluationsWidget extends StatelessWidget{

  ContainerEvaluationsWidget({
    required this.evaluation,
    required this.subject,
  });
  String evaluation;
  String subject;
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: const EdgeInsets.only(top:10,bottom: 10,),
      padding: const EdgeInsets.only(top:20,bottom: 20,left: 30,right:30),
      width: 350,
      height: 140,
      decoration: BoxDecoration(
        color:const Color(0xFF3B3D6D) ,
        borderRadius: BorderRadius.circular(30),
      ),
      child:  Container(
        height: 70, width: 350,
        padding: const EdgeInsets.only(top: 10,left: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow:[
            BoxShadow(
              color:  Color(0xFFAC8FCF),
              blurRadius: 10,
              offset:  Offset(2,2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 20),
                  child:EvaluationsTextWidget(
                    text: LocaleKeys.Subject.tr(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5,),
                  child:EvaluationsTextWidget(
                    text: subject,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 20),
                  child:EvaluationsTextWidget(
                    text: LocaleKeys.Evaluation.tr(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,),
                  child:EvaluationsTextWidget(
                    text: evaluation,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
