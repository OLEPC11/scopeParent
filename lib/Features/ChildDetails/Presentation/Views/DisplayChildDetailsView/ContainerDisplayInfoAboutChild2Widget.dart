import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Data/Model/ChildDetailsModel.dart';
import 'ContainerInfoWidget.dart';

class ContainerDisplayInfoAboutChild2Widget extends StatelessWidget {
  ContainerDisplayInfoAboutChild2Widget({required this.childDetailsModel});
  ChildDetailsModel childDetailsModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:30,left: 20,right: 20),
      child:Container(
        width: 300,
        height: 640,
        decoration:  BoxDecoration(
          color: const Color(0xFFD4E7FE) ,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children:[
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child:  TextWidget(
                text:LocaleKeys.Info_About_Child.tr(),
                color:const Color(0xFF7DA4FF),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily:"Outfit",
              ),
            ),
            Positioned(
              left: 20,
              top: 60,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.question_answer_outlined,
                info: LocaleKeys.Dose_the_child_suffer_from_chronic_diseases1.tr(),
                details: childDetailsModel.chronicDiseases,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 200,
              child: ContainerInfoWidget(
                icon: Icons.question_answer_outlined,
                info: LocaleKeys.Dose_the_child_suffer_from_some_type_of_allergy1.tr(),
                details:childDetailsModel.typeAllergies,
              ),
            ),
            Positioned(
              left: 20,
              top: 340,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.medical_services,
                info: LocaleKeys.Dose_the_child_need_medication1.tr(),
                details: childDetailsModel.medicinesForChild,
              ),
            ),
            Positioned(
              left: 20, top: 480, right: 20,
              child: ContainerInfoWidget(
                icon: Icons.medication_liquid_rounded,
                info: LocaleKeys.The_action_if_the_Child_temperature_suddenly_rises1.tr(),
                details: childDetailsModel.dealingWithHeat,
              ),
            ),
          ],
        ),
      ),
    );
  }
}