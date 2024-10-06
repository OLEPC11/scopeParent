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
        backgroundColor: const Color(0xFFAC8FCF),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 5,right: 10,bottom: 5,left: 10),
            child: Container(
              width: 60,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("assets/images/Logo.png"),
                    fit: BoxFit.cover
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width ,
        child: Column(
          children: [
            const SizedBox(height: 15,),
            HomeItemWidget(),
          ],
        ),
      ),
    );
  }
}
