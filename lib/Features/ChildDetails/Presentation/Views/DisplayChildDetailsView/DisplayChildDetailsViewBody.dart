import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/ChildDetails/Cubit/ShowChildDetailsCubit/ShowChildDetailsCubit.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../main.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../RegistrationRequest/Presentation/Views/AddRegistrationRequestView/TextForImageWidget.dart';
import 'ContainerDisplayInfoAboutChild2Widget.dart';
import 'ContainerDisplayInfoAboutChildWidget.dart';
import 'ContainerDisplayInfoAboutParentWidget.dart';
import 'ContainerDisplayInfoToCommunicateWidget.dart';
import 'ContainerDisplayLatestInfoWidget.dart';
import 'ContainerDisplayPersonalInfoAboutChildWidget.dart';
import 'DisplayChildImageWidget.dart';
import 'ListViewImagesWidget.dart';


class DisplayChildDetailsViewBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ShowChildDetailsCubit,ShowChildDetailsState>(
      builder: (context,state){
        if(state is ShowChildDetailsLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is ShowChildDetailsSuccess){
          return  ListView(
            children: [
              TextForImageWidget(
                text: LocaleKeys.Child_Image.tr(),
              ),
              DisplayChildImageWidget(
                childImage: "http://$ipServer:8000/${state.childDetailsModel.childImagePath}/${state.childDetailsModel.childImageName}",
              ),
              ContainerDisplayInfoAboutChildWidget(childDetailsModel:state.childDetailsModel,),
              ContainerDisplayInfoAboutParentWidget(childDetailsModel: state.childDetailsModel,),
              ContainerDisplayInfoToCommunicateWidget(childDetailsModel:state.childDetailsModel),
              ContainerDisplayInfoAboutChild2Widget(childDetailsModel:state.childDetailsModel),
              ContainerDisplayPersonalInfoAboutChildWidget(childDetailsModel:state.childDetailsModel),
              ContainerDisplayLatestInfoWidget(childDetailsModel:state.childDetailsModel),
              ListViewImagesWidget(childDetailsModel:state.childDetailsModel),
              const SizedBox(
                height: 40,
              ),
            ],
          );
        }
        else if(state is ShowChildDetailsFailure){
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