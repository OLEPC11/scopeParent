import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../Home/Cubit/LanguageCubit/LanguageCubit.dart';

class ContainerInfoWidget extends StatelessWidget{

  ContainerInfoWidget({
    required this.icon,
    required this.info,
    required this.details,
  });
  String details;
  String info;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, width: 350,
      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow:const [
          BoxShadow(
            color:  Color(0xFFAC8FCF),
            blurRadius: 10,
            offset:  Offset(2,2),
          ),
        ],
      ),
      child: Stack(
        children: [
          BlocProvider.of<LanguageCubit>(context).typeLanguage=='en'?Positioned(
            top: 10,
            left: 20,
            child:Icon(color:const Color(0xFF7DA4FF),size:30 ,icon),
          ):Positioned(
            top: 10,
            right: 20,
            child:Icon(color:const Color(0xFF7DA4FF),size:30 ,icon),
          ),
          BlocProvider.of<LanguageCubit>(context).typeLanguage=='en'?
          Positioned(
            top: 10,
            left: 55,
            right: 10,
            child:
            TextWidget(
              text: info,
              color: const Color(0xFF7DA4FF),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Outfit',
            ),
          ):
          Positioned(
            top: 10,
            right: 55,
            left: 10,
            child:
            TextWidget(
              text: info,
              color: const Color(0xFF7DA4FF),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Outfit',
            ),
          ),
          BlocProvider.of<LanguageCubit>(context).typeLanguage=='en'?const Positioned(
            left: 20,
            top: 60,
            child:Icon(color:Color(0xFF7DA4FF),size:30 ,Icons.question_answer),
          ):const Positioned(
            right: 20,
            top: 60,
            child:Icon(color:Color(0xFF7DA4FF),size:30 ,Icons.question_answer),
          ),
          BlocProvider.of<LanguageCubit>(context).typeLanguage=='en'?Positioned(
            left: 55,
            top: 60,
            right: 10,
            child:TextWidget(
              text: details,
              color: const Color(0xFF7DA4FF),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Outfit',
            ),
          ):Positioned(
            right: 55,
            top: 60,
            left: 10,
            child:TextWidget(
              text: details,
              color: const Color(0xFF7DA4FF),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Outfit',
            ),
          ),
        ],
      ),
    );
  }
}
