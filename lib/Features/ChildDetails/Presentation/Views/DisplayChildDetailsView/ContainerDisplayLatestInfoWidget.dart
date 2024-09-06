import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Data/Model/ChildDetailsModel.dart';
import 'ContainerInfoWidget.dart';

class ContainerDisplayLatestInfoWidget extends StatelessWidget {
  ContainerDisplayLatestInfoWidget({required this.childDetailsModel});
  ChildDetailsModel childDetailsModel;
  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsets.only(top:30,left: 20,right: 20),
      child:Container(
        width: 300,
        height: 360,
        decoration:  BoxDecoration(
          color:const Color(0xFF3B3D6D) ,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children:[
            Positioned(
              top: 20,
              right: 20,
              left: 20,
              child:  TextWidget(
                text:LocaleKeys.Latest_Info.tr(),
                color:const Color(0xFF7DA4FF),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily:"Outfit",
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 60,
              child: ContainerInfoWidget(
                icon: Icons.question_answer_outlined,
                info: LocaleKeys.The_Person_Responsible_For_Receiving_The_Child1.tr(),
                details: childDetailsModel.personResponsibleForReceiving,
              ),
            ),
            Positioned(
              left: 20,
              top: 200,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.question_answer_outlined,
                info: LocaleKeys.The_Person_Who_Filled_Out_The_Form1.tr(),
                details: childDetailsModel.personWhoFillsTheForm,
              ),
            ),
          ],
        ),
      ),
    );

  }

}