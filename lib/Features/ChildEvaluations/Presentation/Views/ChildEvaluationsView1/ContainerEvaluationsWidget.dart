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
    return Container(
      height: 70, width: 350,
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
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child:EvaluationsTextWidget(
                  text: LocaleKeys.subject.tr(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child:EvaluationsTextWidget(
                  text: subject,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child:EvaluationsTextWidget(
                  text:  LocaleKeys.evaluation.tr(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child:EvaluationsTextWidget(
                  text: evaluation,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
