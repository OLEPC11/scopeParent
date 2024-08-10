class ChildDetailsModel{
  dynamic childId;
  dynamic childName;
  dynamic dateBirth;
  dynamic placeBirth;
  dynamic numberBrother;
  dynamic arrangementInFamily;
  dynamic gender;
  dynamic childCategoryId;
  dynamic fatherName;
  dynamic fatherQualification;
  dynamic fatherWork;
  dynamic motherName;
  dynamic motherQualification;
  dynamic motherWork;
  dynamic homeAddress;
  dynamic homePhoneNumber;
  dynamic fatherPhoneNumber;
  dynamic motherPhoneNumber;
  dynamic chronicDiseases;
  dynamic typeAllergies;
  dynamic medicinesForChild;
  dynamic dealingWithHeat;
  dynamic favoriteName;
  dynamic favoriteColor;
  dynamic favoriteGame;
  dynamic favoriteMeal;
  dynamic daytimeSleep;
  dynamic nightSleepTime;
  dynamic relationshipWithStrangers;
  dynamic relationshipWithChildren;
  dynamic personResponsibleForReceiving;
  dynamic personWhoFillsTheForm;
  dynamic imageChildPage;
  dynamic imageFatherID;
  dynamic imageMotherID;
  dynamic imageFamilyBook;
  dynamic imageMotherPage;
  dynamic imageFatherPage;
  dynamic imageChildVaccinations;
  dynamic childImageName;
  dynamic childImagePath;

  ChildDetailsModel({
    required this.childId,
    required this.childName,
    required this.dateBirth,
    required this.placeBirth,
    required this.numberBrother,
    required this.arrangementInFamily,
    required this.gender,
    required this.childCategoryId,
    required this.fatherName,
    required this.fatherQualification,
    required this.fatherWork,
    required this.motherName,
    required this.motherQualification,
    required this.motherWork,
    required this.homeAddress,
    required this.homePhoneNumber,
    required this.fatherPhoneNumber,
    required this.motherPhoneNumber,
    required this.chronicDiseases,
    required this.typeAllergies,
    required this.medicinesForChild,
    required this.dealingWithHeat,
    required this.favoriteName,
    required this.favoriteColor,
    required this.favoriteGame,
    required this.favoriteMeal,
    required this.daytimeSleep,
    required this.nightSleepTime,
    required this.relationshipWithStrangers,
    required this.relationshipWithChildren,
    required this.personResponsibleForReceiving,
    required this.personWhoFillsTheForm,
    required this.imageFamilyBook,
    required this.imageFatherPage,
    required this.imageMotherPage,
    required this.imageChildPage,
    required this.imageFatherID,
    required this.imageMotherID,
    required this.imageChildVaccinations,
    required this.childImageName,
    required this.childImagePath
  });
  factory ChildDetailsModel.fromJson( dynamic jsonData){
    return ChildDetailsModel(
      childId:jsonData["studentData"]["id"],
      childName:jsonData["studentData"]["name"],
      dateBirth:jsonData["studentData"]["date_birth"],
      placeBirth:jsonData["studentData"]["place_birth"],
      numberBrother:jsonData["studentData"]["number_brother"],
      arrangementInFamily:jsonData["studentData"]["arrangement_in_family"],
      gender:jsonData["studentData"]["gender"],
      childCategoryId: jsonData["studentData"]["category_id"],
      fatherName:jsonData["studentData"]["name_father"],
      fatherQualification:jsonData["studentData"]["father_academic_qualification"],
      fatherWork:jsonData["studentData"]["father_work"],
      motherName:jsonData["studentData"]["name_mother"],
      motherQualification:jsonData["studentData"]["mother_academic_qualification"],
      motherWork: jsonData["studentData"]["mother_work"],
      homeAddress:jsonData["studentData"]["home_address"],
      homePhoneNumber:jsonData["studentData"]["landline_phone"],
      fatherPhoneNumber:jsonData["studentData"]["father_phone"],
      motherPhoneNumber: jsonData["studentData"]["mother_phone"],
      chronicDiseases:jsonData["studentData"]["chronic_diseases"],
      typeAllergies:jsonData["studentData"]["type_allergies"],
      medicinesForChild:jsonData["studentData"]["medicines_for_child"],
      dealingWithHeat: jsonData["studentData"]["dealing_with_heat"],
      favoriteName:jsonData["studentData"]["preferred_name"],
      favoriteColor: jsonData["studentData"]["favorite_color"],
      favoriteGame:jsonData["studentData"]["favorite_game"],
      favoriteMeal:jsonData["studentData"]["favorite_meal"],
      daytimeSleep:jsonData["studentData"]["daytime_bedtime"],
      nightSleepTime: jsonData["studentData"]["night_sleep_time"],
      relationshipWithStrangers:jsonData["studentData"]["relationship_with_strangers"],
      relationshipWithChildren:jsonData["studentData"]["relationship_with_children"],
      personResponsibleForReceiving:jsonData["studentData"]["person_responsible_for_receiving"],
      personWhoFillsTheForm: jsonData["studentData"]["person_who_fills_the_form"],
      imageFamilyBook:jsonData["studentData"]["photo_family_book"],
      imageFatherPage:jsonData["studentData"]["photo_father_page"],
      imageMotherPage: jsonData["studentData"]["photo_mother_page"],
      imageChildPage:jsonData["studentData"]["photo_child_page"],
      imageFatherID:jsonData["studentData"]["photo_father_identity"],
      imageMotherID:jsonData["studentData"]["photo_mother_identity"],
      imageChildVaccinations: jsonData["studentData"]["photo_vaccine_card"],
      childImageName: jsonData["images"][0]["name"],
      childImagePath:jsonData["images"][0]["path"],
    );
  }
}

