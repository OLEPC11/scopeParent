import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../../Core/Widgets/CustomWidgets/ContainerWidget.dart';
import '../../../Cubit/EditProfileCubit/EditProfileCubit.dart';
import '../../../Cubit/ShowProfileCubit/ShowProfileCubit.dart';
import 'ProfileEditImageWidget.dart';
import 'ProfileEditFieldsWidget.dart';


class  ProfileEditViewBody extends StatelessWidget {

  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit,EditProfileState>(
      listener: (context,state){
        if(state is EditProfileLoading){
          isLoading=true;
        }
        else if(state is EditProfileSuccess){
          print(BlocProvider.of<EditProfileCubit>(context).accessToken);
          print(BlocProvider.of<EditProfileCubit>(context).image);
          print(BlocProvider.of<EditProfileCubit>(context).firstName);
          print(BlocProvider.of<EditProfileCubit>(context).lastName);
          print(BlocProvider.of<EditProfileCubit>(context).phoneNumber);
          print(BlocProvider.of<EditProfileCubit>(context).message);
          BlocProvider.of<ShowProfileCubit>(context).showProfileServices(
            accessToken:  BlocProvider.of<EditProfileCubit>(context).accessToken,
          );
          print(BlocProvider.of<ShowProfileCubit>(context).profileUserModel!.firstName);
          print(BlocProvider.of<ShowProfileCubit>(context).profileUserModel!.lastName);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Update Your Account Successfully"),
            ),
          );
          isLoading=false;
        }
        else if(state is EditProfileFailure){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
          isLoading=false;
        }
      },
      builder: (context,state){
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: ListView(
            children: [
              ProfileEditImageWidget(),
              ContainerWidget(
                padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
                height:480,
                width:220,
                widget:ProfileEditFieldsWidget(),
              ),
              const SizedBox(height: 40,),
            ],
          ),
        );
      },
    );
  }
}
