import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../main.dart';
import '../../../Cubit/ShowProfileCubit/ShowProfileCubit.dart';


class ProfileImageWidget extends StatelessWidget {
  ProfileImageWidget({
    required this.image,
    required this.onTap,
  });
  File? image;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image!=null?
        Padding(
          padding: const EdgeInsets.only(top:20,left: 80,right: 80),
          child: CircleAvatar(
            radius:130,
            backgroundImage: FileImage(image!),
          ),
        ):
        Padding(
          padding: const EdgeInsets.only(top:20,left: 80,right: 80),
          child: CircleAvatar(
            radius:130,
            backgroundImage:NetworkImage(
              "http://$ipServer:8000/${BlocProvider.of<ShowProfileCubit>(context).profileUserModel!.image}",
              scale: 1.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 180, left: 290,right: 80,
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
          ),
        ),
      ],
    );
  }
}
