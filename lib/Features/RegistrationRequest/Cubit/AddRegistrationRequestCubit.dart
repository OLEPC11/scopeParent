import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scope_parent/Features/RegistrationRequest/Data/Repo/AddRegistrationRequestServices.dart';
part 'AddRegistrationRequestState.dart';

class AddRegistrationRequestCubit extends Cubit<AddRegistrationRequestState> {
  AddRegistrationRequestCubit() : super(AddRegistrationRequestInitial());

  dynamic name;
  dynamic dateBirth;
  dynamic placeBirth;
  dynamic numberBrother;
  dynamic arrangementInFamily;
  dynamic gender;
  dynamic categoryId;
  dynamic nameFather;
  dynamic fatherAcademicQualification;
  dynamic fatherWork;
  dynamic nameMother;
  dynamic motherAcademicQualification;
  dynamic motherWork;
  dynamic homeAddress;
  dynamic landlinePhone;
  dynamic fatherPhone;
  dynamic motherPhone;
  dynamic chronicDiseases;
  dynamic typeAllergies;
  dynamic medicinesForChild;
  dynamic dealingWithHeat;
  dynamic preferredName;
  dynamic favoriteColor;
  dynamic favoriteGame;
  dynamic favoriteMeal;
  dynamic dayTimeBedTime;
  dynamic nightSleepTime;
  dynamic relationshipWithStrangers;
  dynamic relationshipWithChildren;
  dynamic personWhoFillsTheForm;
  dynamic personResponsibleForReceiving;
  dynamic accessToken;
  dynamic photoFamilyBook;
  dynamic photoFatherPage;
  dynamic photoMotherPage;
  dynamic photoChildPage;
  dynamic photoFatherIdentity;
  dynamic photoMotherIdentity;
  dynamic photoVaccineCard;
  List<File> imagesForChild=[];


  void addRegistrationRequestServices ({
    required dynamic name,
    required dynamic dateBirth,
    required dynamic placeBirth,
    required dynamic numberBrother,
    required dynamic arrangementInFamily,
    required dynamic gender,
    required dynamic categoryId,
    required dynamic nameFather,
    required dynamic fatherAcademicQualification,
    required dynamic fatherWork,
    required dynamic nameMother,
    required dynamic motherAcademicQualification,
    required dynamic motherWork,
    required dynamic homeAddress,
    required dynamic landlinePhone,
    required dynamic fatherPhone,
    required dynamic motherPhone,
    required dynamic chronicDiseases,
    required dynamic typeAllergies,
    required dynamic medicinesForChild,
    required dynamic dealingWithHeat,
    required dynamic preferredName,
    required dynamic favoriteColor,
    required dynamic favoriteGame,
    required dynamic favoriteMeal,
    required dynamic dayTimeBedTime,
    required dynamic nightSleepTime,
    required dynamic relationshipWithStrangers,
    required dynamic relationshipWithChildren,
    required dynamic personWhoFillsTheForm,
    required dynamic personResponsibleForReceiving,
    required dynamic accessToken,
    required dynamic photoFamilyBook,
    required dynamic photoFatherPage,
    required dynamic photoMotherPage,
    required dynamic photoChildPage,
    required dynamic photoFatherIdentity,
    required dynamic photoMotherIdentity,
    required dynamic photoVaccineCard,
    required List<File> imagesForChild,
  }) async{
    emit(AddRegistrationRequestLoading());
    try{
      Map<String,dynamic>addRegistrationRequest=await AddRegistrationRequestServices().
      addRegistrationRequestServices(
        name: name,
        dateBirth: dateBirth,
        placeBirth: placeBirth,
        numberBrother: numberBrother,
        arrangementInFamily: arrangementInFamily,
        gender: gender,
        categoryId: categoryId,
        nameFather: nameFather,
        fatherAcademicQualification: fatherAcademicQualification,
        fatherWork: fatherWork,
        nameMother: nameMother,
        motherAcademicQualification: motherAcademicQualification,
        motherWork: motherWork,
        homeAddress: homeAddress,
        landlinePhone: landlinePhone,
        fatherPhone: fatherPhone,
        motherPhone: motherPhone,
        chronicDiseases: chronicDiseases,
        typeAllergies: typeAllergies,
        medicinesForChild: medicinesForChild,
        dealingWithHeat: dealingWithHeat,
        preferredName: preferredName,
        favoriteColor: favoriteColor,
        favoriteGame: favoriteGame,
        favoriteMeal: favoriteMeal,
        dayTimeBedTime: dayTimeBedTime,
        nightSleepTime: nightSleepTime,
        relationshipWithStrangers: relationshipWithStrangers,
        relationshipWithChildren: relationshipWithChildren,
        personWhoFillsTheForm: personWhoFillsTheForm,
        personResponsibleForReceiving: personResponsibleForReceiving,
        accessToken: accessToken,
        photoFamilyBook: photoFamilyBook,
        photoFatherPage: photoFatherPage,
        photoMotherPage: photoMotherPage,
        photoChildPage: photoChildPage,
        photoFatherIdentity: photoFatherIdentity,
        photoMotherIdentity: photoMotherIdentity,
        photoVaccineCard: photoVaccineCard,
        imagesForChild: imagesForChild,
      );
      emit(AddRegistrationRequestSuccess());
    }catch (e){
      //emit(AddRegistrationRequestFailure(errorMessage:e.toString()));
      emit(AddRegistrationRequestFailure(errorMessage:"Incorrect Details. Please try again"));
    }
  }
}
