import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/Home/Cubit/RegistrationRequestStateCubit/ShowRegistrationRequestStateCubit.dart';
import 'RegistrationRequestStateItemWidget.dart';

class ShowRegistrationRequestStateBodyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ShowRegistrationRequestStateCubit,ShowRegistrationRequestStateState>(
      builder:(context,state){
        if(state is ShowRegistrationRequestStateLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is ShowRegistrationRequestStateSuccess){
          return  SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.registrationRequestStateModel.length,
                      itemBuilder: (context,index){
                        return RegistrationRequestStateItemWidget(
                          registrationRequestStateModel:state.registrationRequestStateModel[index] ,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        else if(state is ShowRegistrationRequestStateFailure){
          return Center(
            child:TextWidget(
              text:"There Is No Request Available",
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          );
        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
