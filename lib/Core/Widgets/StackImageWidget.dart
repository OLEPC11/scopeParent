import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'SizedBoxWidget.dart';


class  StackImageWidget extends StatelessWidget{
  StackImageWidget({required this.onTap, required this.image});

  Function() onTap;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image!=null?
        SizedBoxWidget(
          height: 250,
          width: 500,
          edgeInsets:  const EdgeInsets.only(top: 20,left: 40,right: 40),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image:DecorationImage(
                image:FileImage(image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ) :
        SizedBoxWidget(
          height: 250,
          width: 500,
          edgeInsets: const EdgeInsets.only(top: 20,left: 40,right: 40),
          child: Container(
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image:const DecorationImage(
                image:AssetImage("assets/images/ImageProfile2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 180,
            left: 350,
            right: 20,
          ),
          child:Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color:const Color(0xFF3B3D6D) ,
              borderRadius:  BorderRadius.circular(100),
            ),
            child:  GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),),
      ],
    );
  }
}
