import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scope_parent/Features/RegistrationRequest/Cubit/AddRegistrationRequestCubit.dart';
import '../../../../../Core/Widgets/StackImageWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Data/Repo/AddRecordOrderServices.dart';
import 'AddButtonWidget.dart';
import 'ContainerInfoAboutChild2Widget.dart';
import 'ContainerInfoAboutChildWidget.dart';
import 'ContainerInfoAboutCommunicateWidget.dart';
import 'ContainerInfoAboutParentWidget.dart';
import 'ContainerLatestInfoWidget.dart';
import 'ContainerPersonalInfoChildWidget.dart';
import 'TextForImageWidget.dart';

class  AddRegistrationRequestViewBody extends StatefulWidget {
  @override
  State<AddRegistrationRequestViewBody> createState()=>_AddRegistrationRequestViewBodyState();
}
class _AddRegistrationRequestViewBodyState extends State<AddRegistrationRequestViewBody>{

  final _formField=GlobalKey<FormState>();
  File? imageChildPage;
  File? imageChild;
  File? imageFatherID;
  File? imageMotherID;
  File? imageFamilyBook;
  File? imageMotherPage;
  File? imageFatherPage;
  File? imageChildVaccinations;

  getImageChildPage() async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null){
      return;
    }
    final imageTemporary=File(image.path);
    setState(() {
      imageChildPage=imageTemporary;
    });
  }
  getImageChild() async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null){
      return;
    }
    final imageTemporary=File(image.path);
    setState(() {
      imageChild=imageTemporary;
      BlocProvider.of<AddRegistrationRequestCubit>(context).imagesForChild.add(imageChild!);
      BlocProvider.of<AddRegistrationRequestCubit>(context).imagesForChild.add(imageChild!);
      BlocProvider.of<AddRegistrationRequestCubit>(context).imagesForChild.add(imageChild!);
      BlocProvider.of<AddRegistrationRequestCubit>(context).imagesForChild.add(imageChild!);
      BlocProvider.of<AddRegistrationRequestCubit>(context).imagesForChild.add(imageChild!);
    });
  }
  getImageFatherID() async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null){
      return;
    }
    final imageTemporary=File(image.path);
    setState(() {
      imageFatherID=imageTemporary;
    });
  }
  getImageMotherID() async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null){
      return;
    }
    final imageTemporary=File(image.path);
    setState(() {
      imageMotherID=imageTemporary;
    });
  }
  getImageMotherPage() async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null){
      return;
    }
    final imageTemporary=File(image.path);
    setState(() {
      imageMotherPage=imageTemporary;
    });
  }
  getImageFatherPage() async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null){
      return;
    }
    final imageTemporary=File(image.path);
    setState(() {
      imageFatherPage=imageTemporary;
    });
  }
  getImageFamilyBook() async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null){
      return;
    }
    final imageTemporary=File(image.path);
    setState(() {
      imageFamilyBook=imageTemporary;
    });
  }
  getImageChildVaccinations() async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null){
      return;
    }
    final imageTemporary=File(image.path);
    setState(() {
      imageChildVaccinations=imageTemporary;
    });
  }
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AddRegistrationRequestCubit>(context).photoFamilyBook=imageFamilyBook;
    BlocProvider.of<AddRegistrationRequestCubit>(context).photoFatherPage=imageFatherPage;
    BlocProvider.of<AddRegistrationRequestCubit>(context).photoMotherPage=imageMotherPage;
    BlocProvider.of<AddRegistrationRequestCubit>(context).photoChildPage=imageChildPage;
    BlocProvider.of<AddRegistrationRequestCubit>(context).photoFatherIdentity=imageFatherID;
    BlocProvider.of<AddRegistrationRequestCubit>(context).photoMotherIdentity=imageMotherID;
    BlocProvider.of<AddRegistrationRequestCubit>(context).photoVaccineCard=imageChildVaccinations;
    return  BlocConsumer<AddRegistrationRequestCubit,AddRegistrationRequestState>(
      listener: (context,state) async {
        if(state is AddRegistrationRequestLoading){
          isLoading=true;
        }
        else if(state is AddRegistrationRequestSuccess){
          BlocProvider.of<AddRegistrationRequestCubit>(context).name =null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).dateBirth=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).placeBirth=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).numberBrother=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).arrangementInFamily=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).gender=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).categoryId=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).nameFather=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).fatherAcademicQualification=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).fatherWork =null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).nameMother =null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).motherAcademicQualification=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).motherWork=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).homeAddress=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).landlinePhone=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).fatherPhone=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).motherPhone=null;

          BlocProvider.of<AddRegistrationRequestCubit>(context).chronicDiseases =null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).typeAllergies =null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).medicinesForChild =null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).dealingWithHeat=null;

          BlocProvider.of<AddRegistrationRequestCubit>(context).preferredName =null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteColor=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteGame =null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteMeal =null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).dayTimeBedTime =null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).nightSleepTime=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithStrangers=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithChildren=null;

          BlocProvider.of<AddRegistrationRequestCubit>(context).personResponsibleForReceiving=null;
          BlocProvider.of<AddRegistrationRequestCubit>(context).personWhoFillsTheForm=null;

          print("Done");
          print(BlocProvider.of<AddRegistrationRequestCubit>(context).accessToken);
          print(state.registrationRequestModel.studentId);
          Map<String,dynamic>data=await AddRecordOrderServices().addRecordOrderServices(
            accessToken:BlocProvider.of<AddRegistrationRequestCubit>(context).accessToken,
            studentId: state.registrationRequestModel.studentId,
          );
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Add Registration Request Successfully"),
            ),
          );
          isLoading=false;
        }
        else if(state is AddRegistrationRequestFailure){
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
          child: ListView(
            children: [
              TextForImageWidget(
                text: LocaleKeys.Child_Image.tr(),
              ),
              StackImageWidget(
                  onTap: getImageChild,
                  image: imageChild
              ),
              ContainerInfoAboutChildWidget(),
              ContainerInfoAboutParentWidget(),
              ContainerInfoAboutCommunicateWidget(),
              ContainerInfoAboutChild2Widget(),
              ContainerPersonalInfoChildWidget(),
              ContainerLatestInfoWidget(),
              TextForImageWidget(
                text: LocaleKeys.Image_Family_Book.tr(),
              ),
              StackImageWidget(
                onTap: getImageFamilyBook,
                image: imageFamilyBook,
              ),
              TextForImageWidget(
                text: LocaleKeys.Image_Father_Page.tr(),
              ),
              StackImageWidget(
                onTap: getImageFatherPage,
                image: imageFatherPage,
              ),
              TextForImageWidget(
                text: LocaleKeys.Image_Mother_Page.tr(),
              ),
              StackImageWidget(
                onTap: getImageMotherPage,
                image: imageMotherPage,
              ),
              TextForImageWidget(
                text:LocaleKeys.Image_Child_Page.tr(),
              ),
              StackImageWidget(
                onTap: getImageChildPage,
                image: imageChildPage,
              ),
              TextForImageWidget(
                text:LocaleKeys.Image_Father_ID.tr(),
              ),
              StackImageWidget(
                onTap: getImageFatherID,
                image: imageFatherID,
              ),
              TextForImageWidget(
                text: LocaleKeys.Image_Mother_ID.tr(),
              ),
              StackImageWidget(
                onTap: getImageMotherID,
                image: imageMotherID,
              ),
              TextForImageWidget(
                text: LocaleKeys.Image_Child_Vaccinations.tr(),
              ),

              StackImageWidget(
                onTap: getImageChildVaccinations,
                image: imageChildVaccinations,
              ),
              Padding(
                padding:const EdgeInsets.only(top: 100,left: 60,right: 60,bottom: 20) ,
                child:AddButtonWidget(
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        );
      },
    );
  }
}
