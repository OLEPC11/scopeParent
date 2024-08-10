import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:scope_parent/Features/ChildDetails/Data/Model/ChildDetailsModel.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import 'ContainerInfoWidget.dart';

class ContainerDisplayInfoAboutChildWidget extends StatelessWidget {
  ContainerDisplayInfoAboutChildWidget({required this.childDetailsModel});
  ChildDetailsModel childDetailsModel;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(top:30,left: 20,right: 20),
      child:Container(
        width: 300,
        height: 1050,
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
                text: LocaleKeys.Info_About_Child.tr(),
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
                info: LocaleKeys.Child_Full_Name.tr(),
                details: childDetailsModel.childName,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 200,
              child: ContainerInfoWidget(
                icon: Icons.location_city_rounded ,
                info: LocaleKeys.Place_Of_Birth.tr(),
                details: childDetailsModel.placeBirth,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 340,
              child: ContainerInfoWidget(
                icon: Icons.calendar_month,
                info: LocaleKeys.Date_Of_Birth.tr(),
                details: childDetailsModel.dateBirth,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 480,
              child: ContainerInfoWidget(
                icon: Icons.family_restroom_sharp,
                info: LocaleKeys.Number_Of_Brothers.tr(),
                details:childDetailsModel.numberBrother,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 620,
              child: ContainerInfoWidget(
                icon: Icons.family_restroom,
                info: LocaleKeys.Arranging_Child_In_Family.tr(),
                details:childDetailsModel.arrangementInFamily,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 760,
              child: ContainerInfoWidget(
                icon: Icons.perm_identity,
                info: LocaleKeys.Child_Gender.tr(),
                details: childDetailsModel.gender,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 900,
              child: ContainerInfoWidget(
                icon: Icons.school,
                info: LocaleKeys.Kindergarten_class.tr(),
                details: "Kg${childDetailsModel.childCategoryId}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}