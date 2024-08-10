
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Data/Model/ChildDetailsModel.dart';
import 'ContainerInfoWidget.dart';

class ContainerDisplayPersonalInfoAboutChildWidget extends StatelessWidget {
  ContainerDisplayPersonalInfoAboutChildWidget({required this.childDetailsModel});
  ChildDetailsModel childDetailsModel;
  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.only(top:30,left: 20,right: 20),
      child:Container(
        width: 300,
        height: 1200,
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
                text: LocaleKeys.Personal_Info_Of_The_Child.tr(),
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
                icon: Icons.favorite,
                info: LocaleKeys.Child_Favorite_Name1.tr(),
                details: childDetailsModel.favoriteName,
              ),
            ),
            Positioned(
              left: 20,
              top: 200,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.favorite,
                info: LocaleKeys.Child_Favorite_Color1.tr(),
                details: childDetailsModel.favoriteColor,
              ),
            ),
            Positioned(
              left: 20,
              top: 340,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.favorite,
                info: LocaleKeys.Child_Favorite_Game1.tr(),
                details: childDetailsModel.favoriteGame,
              ),
            ),
            Positioned(
              left: 20,
              top: 480,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.fastfood,
                info: LocaleKeys.Child_Favorite_Meal1.tr(),
                details: childDetailsModel.favoriteMeal,
              ),
            ),
            Positioned(
              left: 20,
              top: 620,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.timer,
                info: LocaleKeys.Child_Bedtime_During_The_Day1.tr(),
                details: childDetailsModel.daytimeSleep,
              ),
            ),
            Positioned(
              left: 20,
              top: 760,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.timer,
                info: LocaleKeys.Child_Bedtime_At_Night1.tr(),
                details: childDetailsModel.nightSleepTime,
              ),
            ),
            Positioned(
              left: 20,
              top: 900,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.question_answer_outlined,
                info: LocaleKeys.The_Child_Relationship_With_The_Stranger1.tr(),
                details: childDetailsModel.relationshipWithStrangers,
              ),
            ),
            Positioned(
              left: 20,
              top: 1040,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.question_answer_outlined,
                info: LocaleKeys.The_Child_Relationship_With_Other_Children1.tr(),
                details: childDetailsModel.relationshipWithChildren,
              ),
            ),
          ],
        ),
      ),
    );
  }
}