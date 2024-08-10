import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../main.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../RegistrationRequest/Presentation/Views/AddRegistrationRequestView/TextForImageWidget.dart';
import '../../../Data/Model/ChildDetailsModel.dart';
import 'DisplayImageWidget.dart';

class ListViewImagesWidget extends StatelessWidget {
  ListViewImagesWidget({required this.childDetailsModel});
  ChildDetailsModel childDetailsModel;
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          TextForImageWidget(
            text: LocaleKeys.Image_Family_Book.tr(),
          ),
          DisplayImageWidget(
            image: "http://$ipServer:8000/${childDetailsModel.imageFamilyBook}",
          ),
          TextForImageWidget(
            text: LocaleKeys.Image_Father_Page.tr(),
          ),
          DisplayImageWidget(
            image: "http://$ipServer:8000/${childDetailsModel.imageFatherPage}",
          ),
          TextForImageWidget(
            text: LocaleKeys.Image_Mother_Page.tr(),
          ),
          DisplayImageWidget(
            image: "http://$ipServer:8000/${childDetailsModel.imageMotherPage}",
          ),
          TextForImageWidget(
            text: LocaleKeys.Image_Child_Page.tr(),
          ),
          DisplayImageWidget(
            image: "http://$ipServer:8000/${childDetailsModel.imageChildPage}",
          ),
          TextForImageWidget(
            text: LocaleKeys.Image_Father_ID.tr(),
          ),
          DisplayImageWidget(
            image: "http://$ipServer:8000/${childDetailsModel.imageFatherID}",
          ),
          TextForImageWidget(
            text:LocaleKeys.Image_Mother_ID.tr(),
          ),
          DisplayImageWidget(
            image: "http://$ipServer:8000/${childDetailsModel.imageMotherID}",
          ),
          TextForImageWidget(
            text: LocaleKeys.Image_Child_Vaccinations.tr(),
          ),
          DisplayImageWidget(
            image: "http://$ipServer:8000/${childDetailsModel.imageChildVaccinations}",
          ),
        ],
      );
  }
}