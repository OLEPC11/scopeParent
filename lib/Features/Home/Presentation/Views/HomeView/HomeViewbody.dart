import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:scope_parent/Features/Home/Presentation/SettingView.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import 'HomeItemWidget.dart';
class  HomeViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SettingView(),
      appBar: AppBar(
        backgroundColor:const Color(0xFF3B3D6D) ,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width ,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top:0,right: 15,bottom: 10,left: 15),
              width: MediaQuery.of(context).size.width,
              height: 135,
              decoration: const BoxDecoration(
                color:Color(0xFF3B3D6D) ,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text:LocaleKeys.Welcome_To_Our_Application.tr(),
                    color:const Color(0xFF7DA4FF),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/Logo.png"),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            HomeItemWidget(),
          ],
        ),
      ),
    );
  }
}
