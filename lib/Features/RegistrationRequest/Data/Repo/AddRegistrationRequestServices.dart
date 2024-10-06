import 'dart:convert';
import 'dart:io';
import '../../../../main.dart';
import 'package:http/http.dart' as http;

import '../Model/RegistrationRequestModel.dart';


class AddRegistrationRequestServices {
  String baseUrl = "http://$ipServer:8000";

  Future <RegistrationRequestModel> addRegistrationRequestServices({
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
    required dynamic relationshipWithChildren
    ,
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
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/student_registration"),
    );
    request.fields.addAll({
      "name": name,
      "date_birth": dateBirth,
      "place_birth": placeBirth,
      "number_brother": numberBrother,
      "arrangement_in_family": arrangementInFamily,
      "gender": gender,
      "category_id": categoryId,
      "name_father": nameFather,
      "father_academic_qualification": fatherAcademicQualification,
      "father_work": fatherWork,
      "name_mother": nameMother,
      "mother_academic_qualification": motherAcademicQualification,
      "mother_work": motherWork,
      "home_address": homeAddress,
      "landline_phone": landlinePhone,
      "father_phone": fatherPhone,
      "mother_phone": motherPhone,
      "chronic_diseases": chronicDiseases,
      "type_allergies": typeAllergies,
      "medicines_for_child": medicinesForChild,
      "dealing_with_heat": dealingWithHeat,
      "preferred_name": preferredName,
      "favorite_color": favoriteColor,
      "favorite_game": favoriteGame,
      "favorite_meal": favoriteMeal,
      "daytime_bedtime": dayTimeBedTime,
      "night_sleep_time": nightSleepTime,
      "relationship_with_strangers": relationshipWithStrangers,
      "relationship_with_children": relationshipWithChildren,
      "person_who_fills_the_form": personWhoFillsTheForm,
      "person_responsible_for_receiving": personResponsibleForReceiving,
    });
    var headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $accessToken",
    };
    request.files.add(await http.MultipartFile.fromPath(
      'photo_family_book', photoFamilyBook!.path,

    ));
    request.files.add(await http.MultipartFile.fromPath(
      'photo_father_page', photoFatherPage!.path,

    ));
    request.files.add(await http.MultipartFile.fromPath(
      'photo_mother_page', photoMotherPage!.path,

    ));
    request.files.add(await http.MultipartFile.fromPath(
      'photo_child_page', photoChildPage!.path,

    ));
    request.files.add(await http.MultipartFile.fromPath(
      'photo_father_identity', photoFatherIdentity!.path,

    ));
    request.files.add(await http.MultipartFile.fromPath(
      'photo_mother_identity', photoMotherIdentity!.path,

    ));
    request.files.add(await http.MultipartFile.fromPath(
      'photo_vaccine_card', photoVaccineCard!.path,

    ));
    for (var image in imagesForChild) {
      request.files.add(await http.MultipartFile.fromPath(
        'images[]',
        image.path,
      ));
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200||response.statusCode == 201) {
      String data = await response.stream.bytesToString();
      Map<String, dynamic> dataResponse = jsonDecode(data);
      RegistrationRequestModel registrationRequestModel=RegistrationRequestModel.fromJson(dataResponse);
      print(dataResponse);
      return registrationRequestModel;
    }
    else {
      throw Exception(
          "The Error Is In This Request : ${response.statusCode}");
    }
  }
}
