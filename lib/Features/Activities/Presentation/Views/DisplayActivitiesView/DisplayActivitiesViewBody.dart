import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Activities/Cubit/ShowActivitiesCubit.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import 'ActivitiesItemImagesWidget.dart';
import 'ActivitiesItemWidget.dart';

class  DisplayActivitiesViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowActivitiesCubit,ShowActivitiesState>(
      builder: (context,state){
        if(state is ShowActivitiesLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is ShowActivitiesSuccess){
          return SizedBox(
            child:ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount:state.activitiesModel.length,
              itemBuilder: (BuildContext context,index) {
                if(state.activitiesModel[index].activityImages.isEmpty){
                  return ActivitiesItemWidget(activitiesModel:state.activitiesModel[index] ,);
                }
                else{

                  return ActivitiesItemImagesWidget(activitiesModel:state.activitiesModel[index]);
                }
              },
            ),
          );
        }
        else if(state is ShowActivitiesFailure){
          return Center(
            child:TextWidget(
              text:"There Is No Activities Available",
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
              text:"There Is No Activities Available",
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
