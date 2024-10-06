import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/ContainerWidget.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/Homework/Cubit/AddNoteCubit/AddNoteCubit.dart';
import 'package:scope_parent/Features/Homework/Data/Model/HomeworkModel.dart';

import '../../../../../Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import '../../../../../translations/locale_keys.g.dart';

class HomeworkItemWidget extends StatefulWidget {
  HomeworkModel homeworkModel;
  HomeworkItemWidget({required this.homeworkModel});
  @override
  State<HomeworkItemWidget> createState()=>_HomeworkItemWidgetState(
    homeworkModel: homeworkModel,
  );
}
class _HomeworkItemWidgetState extends State<HomeworkItemWidget>{
  _HomeworkItemWidgetState({required this.homeworkModel});
  HomeworkModel homeworkModel;
  final reasonController=TextEditingController();
  bool isLoading=false;
  final _formField=GlobalKey<FormState>();
  Future openDialog()=> showDialog(
    context: context,
    builder: (context)=>BlocConsumer<AddNoteCubit,AddNoteState>(
      listener: (context,state){
        if(state is AddNoteLoading){
          isLoading=true;
        }
        else if(state is AddNoteSuccess){
          print("Done");
          Navigator.pop(context);
          isLoading=false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Your Note Add Successfully"),
            ),
          );
        }
        else if(state is AddNoteFailure){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
          isLoading=false;
        }
      },
      builder:(context,state){
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: _formField,
            child:  AlertDialog(
              title: TextWidget(
                text: LocaleKeys.Add_Your_Reason.tr(),
                color: const Color(0xFF7DA4FF),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Outfit",
              ),
              content: CustomTextFormFieldWidget(
                obscureText: false,
                controller: reasonController,
                hintText:LocaleKeys.Enter_The_Reason.tr(),
                icon: const Icon(
                  Icons.question_answer,
                  color: Color(0xFF7DA4FF),
                  size: 20,
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return(LocaleKeys.Enter_The_Reason.tr());
                  }},
              ),
              actions: [
                CustomButtonWidget(
                  onTap: ()async{
                    print(homeworkModel.homeworkId);
                    print(reasonController.text);
                    print( BlocProvider.of<AddNoteCubit>(context).accessToken);
                    print( BlocProvider.of<AddNoteCubit>(context).nameChild);
                    if(_formField.currentState!.validate()) {
                      BlocProvider.of<AddNoteCubit>(context).addNoteServices(
                        homeworkId:homeworkModel.homeworkId,
                        note: reasonController.text,
                        accessToken: BlocProvider.of<AddNoteCubit>(context).accessToken,
                        nameChild: BlocProvider.of<AddNoteCubit>(context).nameChild,
                      );
                    }},
                  text: LocaleKeys.Next.tr(),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 30,),
      width: 220, height: 330,
      widget: Stack(
        children: [
          Positioned(
            top: 10, left: 20, right: 210,
            child:TextWidget(
              text: "Homework",
              color:const Color(0xFF7DA4FF),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          const Positioned(
              top: 65, left: 10,
              child: Icon(Icons.calendar_today_outlined ,size: 20,color: Color(0xFFAC8FCF),)
          ),
          Positioned(
            top: 65, left: 70, right: 130,
            child: TextWidget(
              text: homeworkModel.day+"   "+homeworkModel.date,
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          const Positioned(
              top: 110,
              left: 12,
              child: Icon(Icons.subject ,size: 22,color: Color(0xFFAC8FCF),)
          ),
          Positioned(
            top: 110, left: 70, right: 160,
            child: TextWidget(
              text: homeworkModel.subject,
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          const Positioned(
              top: 155, left: 10,
              child: Icon(Icons.description ,size: 25,color: Color(0xFFAC8FCF),)
          ),
          Positioned(
            top: 155, left: 70, right: 20,
            child: TextWidget(
              text: homeworkModel.lessonName,
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          const Positioned(
              top: 200, left: 10,
              child: Icon(Icons.description ,size: 25,color: Color(0xFFAC8FCF),)
          ),
          Positioned(
            top: 200, left: 70, right: 20,
            child: TextWidget(
              text: homeworkModel.homework,
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            top: 250, left: 70, right: 70,
            child: CustomButtonWidget(
              text:"Add Your Reason",
              onTap:openDialog,
            ),
          ),
        ],
      ),
    );
  }
}














