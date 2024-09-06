import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Homework/Cubit/HomeworkCubit.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import 'HomeworkItemWidget.dart';

class  HomeworkViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeworkCubit,HomeworkState>(
      builder: (context,state){
        if(state is HomeworkLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is HomeworkSuccess ){
          return SizedBox(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount:state.homeworkModel.length,
              itemBuilder: (BuildContext context,index) {
                return HomeworkItemWidget(homeworkModel: state.homeworkModel[index],);},),
          );
        }
        else if(state is HomeworkFailure){
          print(state.errorMessage);
          return Center(
            child:TextWidget(
              text:"There Is No Homework Available",
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          );
        }
        else{
          return Center(
            child:TextWidget(
              text:"There Is No Homework Available",
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          );
        }},
    );
  }
}
