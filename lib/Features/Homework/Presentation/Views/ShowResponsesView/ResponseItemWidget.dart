import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/ContainerWidget.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/Homework/Cubit/DeleteNoteCubit/DeleteNoteCubit.dart';
import 'package:scope_parent/Features/Homework/Cubit/ShowResponseCubit/ShowResponseCubit.dart';
import 'package:scope_parent/Features/Homework/Cubit/UpdateNoteCubit/UpdateNoteCubit.dart';
import 'package:scope_parent/Features/Homework/Data/Model/ResponseModel.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import '../../../../../translations/locale_keys.g.dart';



class ResponseItemWidget extends StatefulWidget {
  ResponseModel responseModel;
  ResponseItemWidget({required this.responseModel});
  @override
  State<ResponseItemWidget> createState()=>_ResponseItemWidgetState(
    responseModel: responseModel,
  );
}
class _ResponseItemWidgetState extends State<ResponseItemWidget>{
  ResponseModel responseModel;
  _ResponseItemWidgetState({required this.responseModel});
  bool isLoading=false;
  final reasonController=TextEditingController();
  final _formField=GlobalKey<FormState>();
  Future openDialog()=> showDialog(
    context: context,
    builder: (context)=>BlocConsumer<UpdateNoteCubit,UpdateNoteState>(
      listener: (context,state){
        if(state is UpdateNoteLoading){
          isLoading=true;
        }
        else if(state is UpdateNoteSuccess){
          print("Done");
          Navigator.pop(context);
          BlocProvider.of<ShowResponseCubit>(context).showResponseServices(
            accessToken:  BlocProvider.of<ShowResponseCubit>(context).accessToken,
            nameChild: BlocProvider.of<ShowResponseCubit>(context).nameChild,
            type: "day",
          );
          isLoading=false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Your Note Update Successfully"),
            ),
          );
        }
        else if(state is UpdateNoteFailure){
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
                    if(_formField.currentState!.validate()) {
                      BlocProvider.of<UpdateNoteCubit>(context).updateNoteServices(
                        note: reasonController.text,
                        accessToken: BlocProvider.of<UpdateNoteCubit>(context).accessToken,
                        noteId: responseModel.noteId,
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
              text: "Response",
              color:const Color(0xFF7DA4FF),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          responseModel.teacherResponse==null?
          Positioned(
            top: 10, left: 210, right: 20,
            child:PopupMenuButton(
              color: const Color(0xFF363567),
              itemBuilder: (BuildContext context)=>[
                PopupMenuItem(
                  child:Padding(
                    padding:const EdgeInsets.only(top: 5,right:0),
                    child: IconButton(
                      icon:const Icon(Icons.add,color:Color(0xFFAD90D2),),
                      onPressed: openDialog,
                    ),
                  ),
                ),
                PopupMenuItem(
                  child:Padding(
                    padding:const EdgeInsets.only(top: 5,right:0),
                    child:  BlocConsumer<DeleteNoteCubit,DeleteNoteState>(
                      listener: (context,state){
                        if(state is DeleteNoteLoading){
                          isLoading=true;
                        }
                        else if(state is DeleteNoteSuccess){
                          Navigator.pop(context);
                          BlocProvider.of<ShowResponseCubit>(context).showResponseServices(
                            accessToken:  BlocProvider.of<ShowResponseCubit>(context).accessToken,
                            nameChild: BlocProvider.of<ShowResponseCubit>(context).nameChild,
                            type: "day",
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Delete Successfully"),
                            ),
                          );
                          isLoading=false;
                        }
                        else if(state is DeleteNoteFailure){
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
                          child: IconButton(
                            icon:const Icon(Icons.delete,color: Color(0xFFAD90D2),),
                            onPressed: (){
                              BlocProvider.of<DeleteNoteCubit>(context).deleteNoteServices(
                                accessToken:  BlocProvider.of<ShowResponseCubit>(context).accessToken,
                                noteId: responseModel.noteId,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ):Positioned(
            top: 10, left: 20, right: 210,
            child: TextWidget(
              text:" ",
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
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
              text:responseModel.date,
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
              text: responseModel.subject,
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
              text: responseModel.lessonName,
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
              text: responseModel.homework,
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            top: 250, left: 70, right: 70,
            child:TextWidget(
              text: responseModel.parentNote,
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          responseModel.teacherResponse!=null?
          Positioned(
            top: 280, left: 70, right: 70,
            child:TextWidget(
              text: responseModel.teacherResponse,
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ):Positioned(
            top: 280, left: 70, right: 70,
            child:TextWidget(
              text:"No Response",
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          )
        ],
      ),
    );
  }
}














