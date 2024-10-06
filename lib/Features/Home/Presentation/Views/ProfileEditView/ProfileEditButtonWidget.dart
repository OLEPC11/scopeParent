import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Cubit/EditProfileCubit/EditProfileCubit.dart';


class ProfileEditButtonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      text:LocaleKeys.Edit_Your_Profile.tr() ,
      onTap: ()async{
        print("firstName:" +BlocProvider.of<EditProfileCubit>(context).firstName );
        print("lastName:" +BlocProvider.of<EditProfileCubit>(context).lastName );
        // print("image:" +(BlocProvider.of<EditProfileCubit>(context).image));
        BlocProvider.of<EditProfileCubit>(context).editProfileServices(
          image:BlocProvider.of<EditProfileCubit>(context).image ,
          firstName: BlocProvider.of<EditProfileCubit>(context).firstName ,
          lastName: BlocProvider.of<EditProfileCubit>(context).lastName ,
          phoneNumber: BlocProvider.of<EditProfileCubit>(context).phoneNumber ,
          password:BlocProvider.of<EditProfileCubit>(context).password,
          accessToken:  BlocProvider.of<EditProfileCubit>(context).accessToken,
        );
      },
    );
  }
}
