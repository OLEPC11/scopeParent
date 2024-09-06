import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Data/Model/ChildDetailsModel.dart';
import 'ContainerInfoWidget.dart';

class ContainerDisplayInfoToCommunicateWidget extends StatelessWidget {
  ContainerDisplayInfoToCommunicateWidget({required this.childDetailsModel});
  ChildDetailsModel childDetailsModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:30,left: 20,right: 20),
      child:Container(
        width: 300,
        height: 640,
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
                text:LocaleKeys.Info_To_Communicate.tr(),
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
                icon: Icons.location_city_outlined,
                info: LocaleKeys.Home_Address.tr(),
                details: childDetailsModel.homeAddress,
              ),
            ),
            Positioned(
              left: 20,
              top: 200,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.phone,
                info: LocaleKeys.Home_Phone_Number.tr(),
                details:  childDetailsModel.homePhoneNumber,
              ),
            ),
            Positioned(
              left: 20,
              top: 340,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.phone_android,
                info:LocaleKeys.Father_Phone_Number.tr(),
                details:  childDetailsModel.fatherPhoneNumber,
              ),
            ),
            Positioned(
              left: 20,
              top: 480,
              right: 20,
              child: ContainerInfoWidget(
                icon: Icons.phone_android,
                info: LocaleKeys.Mother_Phone_Number.tr(),
                details:  childDetailsModel.motherPhoneNumber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}