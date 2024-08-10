import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Cubit/EditProfileCubit/EditProfileCubit.dart';
import 'ProfileImageWidget.dart';

class  ProfileEditImageWidget extends StatefulWidget {
  @override
  State<ProfileEditImageWidget> createState()=>_ProfileEditImageWidgetState();
}
class _ProfileEditImageWidgetState extends State<ProfileEditImageWidget>{
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
    BlocProvider.of<EditProfileCubit>(context).image=imageProfile;
    return ProfileImageWidget(
      onTap: getImageTeacher,
      image: imageProfile,
    );
  }
}
