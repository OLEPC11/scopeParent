import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/RegistrationRequest/Cubit/AddRegistrationRequestCubit.dart';
import '../../../../../../Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import '../../../../../translations/locale_keys.g.dart';

class AddButtonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      text: LocaleKeys.Submit.tr(),
      onTap: ()async{
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).name);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).dateBirth);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).placeBirth);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).numberBrother);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).arrangementInFamily);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).gender);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).categoryId);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).nameFather);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).fatherAcademicQualification);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).fatherWork);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).nameMother);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).motherAcademicQualification);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).motherWork);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).homeAddress);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).landlinePhone);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).fatherPhone);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).motherPhone);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).chronicDiseases);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).typeAllergies);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).medicinesForChild);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).dealingWithHeat);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).preferredName);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteColor);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteGame);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteMeal);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).dayTimeBedTime);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).nightSleepTime);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithStrangers);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithChildren);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).personWhoFillsTheForm);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).personResponsibleForReceiving);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).accessToken);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).photoFamilyBook);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).photoFatherPage);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).photoMotherPage);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).photoChildPage);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).photoFatherIdentity);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).photoMotherIdentity);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).photoVaccineCard);
        print(BlocProvider.of<AddRegistrationRequestCubit>(context).imagesForChild);

        BlocProvider.of<AddRegistrationRequestCubit>(context).addRegistrationRequestServices(
          name:BlocProvider.of<AddRegistrationRequestCubit>(context).name,
          dateBirth:BlocProvider.of<AddRegistrationRequestCubit>(context).dateBirth,
          placeBirth:BlocProvider.of<AddRegistrationRequestCubit>(context).placeBirth,
          numberBrother:BlocProvider.of<AddRegistrationRequestCubit>(context).numberBrother,
          arrangementInFamily:BlocProvider.of<AddRegistrationRequestCubit>(context).arrangementInFamily,
          gender:BlocProvider.of<AddRegistrationRequestCubit>(context).gender,
          categoryId:BlocProvider.of<AddRegistrationRequestCubit>(context).categoryId,
          nameFather:BlocProvider.of<AddRegistrationRequestCubit>(context).nameFather,
          fatherAcademicQualification:BlocProvider.of<AddRegistrationRequestCubit>(context).fatherAcademicQualification,
          fatherWork:BlocProvider.of<AddRegistrationRequestCubit>(context).fatherWork,
          nameMother:BlocProvider.of<AddRegistrationRequestCubit>(context).nameMother,
          motherAcademicQualification:BlocProvider.of<AddRegistrationRequestCubit>(context).motherAcademicQualification,
          motherWork:BlocProvider.of<AddRegistrationRequestCubit>(context).motherWork,
          homeAddress:BlocProvider.of<AddRegistrationRequestCubit>(context).homeAddress,
          landlinePhone:BlocProvider.of<AddRegistrationRequestCubit>(context).landlinePhone,
          fatherPhone:BlocProvider.of<AddRegistrationRequestCubit>(context).fatherPhone,
          motherPhone:BlocProvider.of<AddRegistrationRequestCubit>(context).motherPhone,
          chronicDiseases:BlocProvider.of<AddRegistrationRequestCubit>(context).chronicDiseases,
          typeAllergies:BlocProvider.of<AddRegistrationRequestCubit>(context).typeAllergies,
          medicinesForChild:BlocProvider.of<AddRegistrationRequestCubit>(context).medicinesForChild,
          dealingWithHeat:BlocProvider.of<AddRegistrationRequestCubit>(context).dealingWithHeat,
          preferredName:BlocProvider.of<AddRegistrationRequestCubit>(context).preferredName,
          favoriteColor:BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteColor,
          favoriteGame:BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteGame,
          favoriteMeal:BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteMeal,
          dayTimeBedTime:BlocProvider.of<AddRegistrationRequestCubit>(context).dayTimeBedTime,
          nightSleepTime:BlocProvider.of<AddRegistrationRequestCubit>(context).nightSleepTime,
          relationshipWithStrangers:BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithStrangers,
          relationshipWithChildren:BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithChildren,
          personWhoFillsTheForm:BlocProvider.of<AddRegistrationRequestCubit>(context).personWhoFillsTheForm,
          personResponsibleForReceiving:BlocProvider.of<AddRegistrationRequestCubit>(context).personResponsibleForReceiving,
          accessToken:BlocProvider.of<AddRegistrationRequestCubit>(context).accessToken,
          photoFamilyBook:BlocProvider.of<AddRegistrationRequestCubit>(context).photoFamilyBook,
          photoFatherPage:BlocProvider.of<AddRegistrationRequestCubit>(context).photoFatherPage,
          photoMotherPage:BlocProvider.of<AddRegistrationRequestCubit>(context).photoMotherPage,
          photoChildPage:BlocProvider.of<AddRegistrationRequestCubit>(context).photoChildPage,
          photoFatherIdentity:BlocProvider.of<AddRegistrationRequestCubit>(context).photoFatherIdentity,
          photoMotherIdentity:BlocProvider.of<AddRegistrationRequestCubit>(context).photoMotherIdentity,
          photoVaccineCard:BlocProvider.of<AddRegistrationRequestCubit>(context).photoVaccineCard,
          imagesForChild:BlocProvider.of<AddRegistrationRequestCubit>(context).imagesForChild,
        );
      },
    );
  }
}