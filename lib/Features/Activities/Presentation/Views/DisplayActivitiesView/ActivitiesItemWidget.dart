import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Activities/Cubit/ShowActivitiesCubit.dart';
import 'package:scope_parent/Features/Activities/Data/Model/ActivitiesModel.dart';
import '../../../../../Core/Widgets/TextWidget.dart';

class  ActivitiesItemWidget extends StatelessWidget {
  ActivitiesItemWidget({required this.activitiesModel});
  ActivitiesModel activitiesModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(0xFFAC8FCF),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(bottom: 20,left: 20,right: 20,top: 30),
        child:Stack(
          children: [
            Positioned(
              top: 10, left: 10,
              child:Container(
                height: 140, width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/Logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 170, top: 40,
              child: TextWidget(
                text:activitiesModel.activityDate ,
                color:const Color(0xFF7DA4FF),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Outfit",
              ),
            ),
            Positioned(
              left: 170, right: 20, top: 80,
              child:  TextWidget(
                text: activitiesModel.activityName,
                color:const Color(0xFF7DA4FF),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Outfit",
              ),
            ),
            Positioned(
              top: 160, left: 10, right: 10,
              child: TextWidget(
                text:activitiesModel.activityPost,
                color:const Color(0xFF7DA4FF),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: "Outfit",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
