import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/ChildDetails/Data/Model/ChildModel.dart';
import 'package:scope_parent/Features/Homework/Cubit/AddNoteCubit/AddNoteCubit.dart';
import 'package:scope_parent/Features/Homework/Cubit/ShowResponseCubit/ShowResponseCubit.dart';
import 'package:scope_parent/Features/Homework/Presentation/HomeworkView.dart';
import 'package:scope_parent/Features/Homework/Presentation/ShowResponsesView.dart';
import '../../../../../main.dart';
import '../../../Cubit/HomeworkCubit/HomeworkCubit.dart';

class  ChildrenHomeworkItemWidget extends StatelessWidget {
  ChildrenHomeworkItemWidget({required this.childModel});
  ChildModel childModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xFFAC8FCF),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(bottom: 20,left: 20,right: 20,top: 20),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image:NetworkImage(
                        "http://$ipServer:8000/${childModel.childImagePath}/${childModel.childImageName}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(Icons.person),
                        const SizedBox(
                          width: 20,
                        ),
                        TextWidget(
                          text: childModel.childName,
                          color:const Color(0xFF7DA4FF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(Icons.school),
                        const SizedBox(
                          width: 20,
                        ),
                        TextWidget(
                          text:childModel.childCategory,
                          color:const Color(0xFF7DA4FF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWidget(
              text: "Show Homework",
              onTap: (){
                print(childModel.childCategoryId);
                BlocProvider.of<HomeworkCubit>(context).categoryId=childModel.childCategoryId;
                BlocProvider.of<AddNoteCubit>(context).nameChild=childModel.childName;
                BlocProvider.of<HomeworkCubit>(context).showHomeworkServices(
                  categoryId: childModel.childCategoryId,
                  type:"day",
                );
                Navigator.push(context, MaterialPageRoute(
                    builder:(BuildContext context){
                      return HomeworkView();
                    }),);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWidget(
              text: "Show Response",
              onTap: (){
                BlocProvider.of<ShowResponseCubit>(context).nameChild=childModel.childName;
                BlocProvider.of<ShowResponseCubit>(context).showResponseServices(
                  accessToken:  BlocProvider.of<ShowResponseCubit>(context).accessToken,
                  nameChild: childModel.childName,
                  type: "day",
                );
                Navigator.push(context, MaterialPageRoute(
                    builder:(BuildContext context){
                      return ShowResponsesView();
                    }),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
