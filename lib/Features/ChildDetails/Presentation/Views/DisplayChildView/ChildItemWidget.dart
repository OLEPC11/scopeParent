import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/ChildDetails/Cubit/ShowChildDetailsCubit/ShowChildDetailsCubit.dart';
import 'package:scope_parent/Features/ChildDetails/Data/Model/ChildModel.dart';
import 'package:scope_parent/Features/ChildDetails/Presentation/DisplayChildDetailsView.dart';

import '../../../../../main.dart';

class  ChildItemWidget extends StatelessWidget {
  ChildItemWidget({required this.childModel});
  ChildModel childModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ShowChildDetailsCubit>(context).showChildDetailsServices(
          childId: childModel.childId,
        );
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) {
            return DisplayChildDetailsView();
          },
        ));
      },
      child: Row(
        children: [
          Expanded(
            flex: 50,
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color(0xFFAC8FCF),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(bottom: 20, left: 60, right: 60, top: 30),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 80,right: 80),
                      child:  Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(120),
                          image: DecorationImage(
                            image: NetworkImage(
                              "http://$ipServer:8000/${childModel.childImagePath}/${childModel.childImageName}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(width: 20),
                        const Icon(Icons.person),
                        const SizedBox(width: 20),
                        TextWidget(
                          text: childModel.childName,
                          color: Color(0xFF7DA4FF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                        const SizedBox(width: 10),
                        const SizedBox(width: 30),
                        const Icon(Icons.school),
                        const SizedBox(width: 20),
                        TextWidget(
                          text: childModel.childCategory,
                          color: Color(0xFF7DA4FF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                      ],
                    ),
                  ],
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }

}