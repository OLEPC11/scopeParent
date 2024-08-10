import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Login/Cubit/LoginCubit.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../Home/Cubit/EditProfileCubit/EditProfileCubit.dart';
import '../../../../Home/Cubit/ShowProfileCubit/ShowProfileCubit.dart';

class LoginButtonWidget extends StatelessWidget{
  LoginButtonWidget({
    required this.formField,
  });
  final formField;
  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      text: LocaleKeys.Login.tr(),
      onTap: ()async{
        if(formField.currentState!.validate()){
          print(BlocProvider.of<LoginCubit>(context).email);
          print(BlocProvider.of<LoginCubit>(context).password);
          BlocProvider.of<LoginCubit>(context).loginServices(
            email: BlocProvider.of<LoginCubit>(context).email ,
            password: BlocProvider.of<LoginCubit>(context).password ,
          );
          BlocProvider.of<EditProfileCubit>(context).password=BlocProvider.of<LoginCubit>(context).password;
          BlocProvider.of<ShowProfileCubit>(context).password=BlocProvider.of<LoginCubit>(context).password;
        }
      },
    );
  }
}
