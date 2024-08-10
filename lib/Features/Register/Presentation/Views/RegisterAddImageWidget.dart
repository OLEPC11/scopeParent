import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scope_parent/Features/Register/Cubit/RegisterCubit.dart';
import 'package:scope_parent/Features/Register/Presentation/Views/RegisterImageWidget.dart';

class  RegisterAddImageWidget extends StatefulWidget {
  @override
  State<RegisterAddImageWidget> createState()=>_RegisterAddImageWidgetState();
}
class _RegisterAddImageWidgetState extends State<RegisterAddImageWidget>{
  File? imageProfile;
  getImageTeacher() async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null){
      return;
    }
    final imageTemporary=File(image.path);
    setState(() {
      imageProfile=imageTemporary;
    });
  }
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RegisterCubit>(context).image=imageProfile;
    return RegisterImageWidget(
      onTap: getImageTeacher,
      image: imageProfile,
    );
  }
}
