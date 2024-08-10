import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/ContainerWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Cubit/AddRegistrationRequestCubit.dart';

class  ContainerInfoAboutCommunicateWidget extends StatelessWidget {

  TextEditingController homeAddressController=TextEditingController();
  TextEditingController homePhoneNumberController=TextEditingController();
  TextEditingController fatherPhoneNumberController=TextEditingController();
  TextEditingController motherPhoneNumberController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    // homeAddressController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).homeAddress ?? '';
    // homePhoneNumberController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).landlinePhone ?? '';
    // fatherPhoneNumberController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).fatherPhone ?? '';
    // motherPhoneNumberController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).motherPhone ?? '';
    return   ContainerWidget(
      padding: const EdgeInsets.only(top:50,left: 20,right: 20),
      height:400, width:220,
      widget: Stack(
        children: [
          Positioned(
            top: 10, left: 20,right: 20,
            child:TextWidget(
              text: LocaleKeys.Info_To_Communicate.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            top:60, left: 20, right: 20,
            child: CustomTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).homeAddress=value;
              },
              obscureText: false,
              controller: homeAddressController,
              hintText: LocaleKeys.Enter_Home_Address.tr(),
              icon: const Icon(
                Icons.location_city_outlined,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Home_Address.tr());
                }},
            ),
          ),
          Positioned(
            top:140, left: 20, right: 20,
            child: CustomTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).landlinePhone=value;
              },
              obscureText: false,
              controller: homePhoneNumberController,
              hintText:LocaleKeys.Enter_Home_Phone_Number.tr(),
              type: TextInputType.phone,
              icon: const Icon(
                Icons.phone,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Home_Phone_Number.tr());
                }},
            ),
          ),
          Positioned(
            top:220, left: 20, right: 20,
            child:  CustomTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).fatherPhone=value;
              },
              obscureText: false,
              controller:fatherPhoneNumberController,
              hintText: LocaleKeys.Enter_Father_Phone_Number.tr(),
              type: TextInputType.phone,
              icon: const Icon(
                Icons.phone_android ,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Father_Phone_Number.tr());
                }},
            ),
          ),
          Positioned(
            top:300, left: 20, right: 20,
            child: CustomTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).motherPhone=value;
              },
              obscureText: false,
              controller:motherPhoneNumberController ,
              hintText: LocaleKeys.Enter_Mother_Phone_Number.tr(),
              type: TextInputType.phone,
              icon: const Icon(
                Icons.phone_android,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Mother_Phone_Number.tr());
                }},
            ),
          ),
        ],
      ),
    );
  }
}
