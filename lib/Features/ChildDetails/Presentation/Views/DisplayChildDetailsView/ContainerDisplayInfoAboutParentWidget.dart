import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Data/Model/ChildDetailsModel.dart';
import 'ContainerInfoWidget.dart';

class ContainerDisplayInfoAboutParentWidget extends StatelessWidget {
  ContainerDisplayInfoAboutParentWidget({required this.childDetailsModel});
  ChildDetailsModel childDetailsModel;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(top:30,left: 20,right: 20),
      child:Container(
        width: 300,
        height: 920,
        decoration:  BoxDecoration(
          color:const Color(0xFF3B3D6D) ,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children:[
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child:  TextWidget(
                text: LocaleKeys.Info_About_Parent.tr(),
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
                icon: Icons.person,
                info: LocaleKeys.Father_Name.tr(),
                details:childDetailsModel.fatherName,
              ),
            ),
            Positioned(
              left: 20,
              top: 200,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.school,
                info: LocaleKeys.Father_Qualification.tr(),
                details: childDetailsModel.fatherQualification,
              ),
            ),
            Positioned(
              left: 20,
              top: 340,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.work,
                info: LocaleKeys.Father_Work.tr(),
                details:childDetailsModel.fatherWork,
              ),
            ),
            Positioned(
              left: 20,
              top: 480,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.person,
                info: LocaleKeys.Mother_Name.tr(),
                details: childDetailsModel.motherName,
              ),
            ),
            Positioned(
              left: 20,
              top: 620,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.school,
                info: LocaleKeys.Mother_Qualification.tr(),
                details: childDetailsModel.motherQualification,
              ),
            ),
            Positioned(
              left: 20,
              top: 760,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.work,
                info:LocaleKeys.Mother_Work.tr(),
                details: childDetailsModel.motherWork,
              ),
            ),
          ],
        ),
      ),
    );
  }
}