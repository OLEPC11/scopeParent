import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/ContainerWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Cubit/AddRegistrationRequestCubit.dart';
import 'AnswerTextFormFieldWidget.dart';

class  ContainerLatestInfoWidget extends StatelessWidget {

  TextEditingController personResponsibleReceivingController=TextEditingController();
  TextEditingController personFilledController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    personResponsibleReceivingController.text= BlocProvider.of<AddRegistrationRequestCubit>(context).personResponsibleForReceiving ?? '';
    personFilledController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).personWhoFillsTheForm ?? '';

    return  ContainerWidget(
      padding: const EdgeInsets.only(top:50,left: 20,right: 20),
      height:300, width:220,
      widget: Stack(
        children: [
          Positioned(
            top: 10, left: 20,right: 20,
            child:TextWidget(
              text: LocaleKeys.Latest_Info.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            top: 50, left: 20, right: 20,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text:LocaleKeys.The_Person_Responsible_For_Receiving_The_Child.tr(),
                    color:const Color(0xFF7DA4FF),
                    fontSize:16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top:110, left: 20, right: 20,
            child: AnswerTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).personResponsibleForReceiving=value;
                BlocProvider.of<AddRegistrationRequestCubit>(context).personResponsibleForReceiving=personResponsibleReceivingController.text;
              },
              controller: personResponsibleReceivingController,
            ),
          ),
          Positioned(
            top: 180, left: 20, right: 30,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: LocaleKeys.The_Person_Who_Filled_Out_The_Form.tr(),
                    color:const Color(0xFF7DA4FF),
                    fontSize:16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top:210, left: 20, right: 20,
            child:  AnswerTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).personWhoFillsTheForm=value;
                BlocProvider.of<AddRegistrationRequestCubit>(context).personWhoFillsTheForm=personFilledController.text;
              },
              controller:personFilledController,
            ),
          ),
        ],
      ),
    );
  }
}
