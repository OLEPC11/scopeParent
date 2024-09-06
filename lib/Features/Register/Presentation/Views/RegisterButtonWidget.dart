import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Register/Cubit/RegisterCubit.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../Home/Cubit/EditProfileCubit/EditProfileCubit.dart';
import '../../../Home/Cubit/ShowProfileCubit/ShowProfileCubit.dart';


class RegisterButtonWidget extends StatelessWidget{
  RegisterButtonWidget({
    required this.formField,
  });
  final formField;
  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      text:LocaleKeys.Register.tr() ,
      onTap: ()async{
        if(formField.currentState!.validate()){
          BlocProvider.of<RegisterCubit>(context).registerServices(
            image:BlocProvider.of<RegisterCubit>(context).image ,
            firstName: BlocProvider.of<RegisterCubit>(context).firstName ,
            lastName: BlocProvider.of<RegisterCubit>(context).lastName ,
            phoneNumber: BlocProvider.of<RegisterCubit>(context).phoneNumber ,
            email: BlocProvider.of<RegisterCubit>(context).email ,
            password: BlocProvider.of<RegisterCubit>(context).password ,
          );
          BlocProvider.of<EditProfileCubit>(context).password=BlocProvider.of<RegisterCubit>(context).password;
          BlocProvider.of<ShowProfileCubit>(context).password=BlocProvider.of<RegisterCubit>(context).password;
        }
      },
    );
  }
}
