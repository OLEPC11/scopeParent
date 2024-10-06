import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../ChildDetails/Cubit/ShowAllChildCubit/ShowAllChildCubit.dart';
import 'ChildrenEvaluationsItemWidget.dart';


class  DisplayChildrenEvaluationsViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowAllChildCubit,ShowAllChildState>(
      builder: (context,state){
        if(state is ShowAllChildLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is ShowAllChildSuccess){
          return     SizedBox(
            child:  ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount:state.childModelList.length,
              itemBuilder: (BuildContext context,index) {
                return ChildrenEvaluationsItemWidget(childModel:state.childModelList[index],);
              },
            ),
          );
        }
        else if(state is ShowAllChildFailure){
          return Center(
            child:TextWidget(
              text:"There Is Error",
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
              text:"There Is No Student Available",
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          );
        }
      },
    );
  }
}
