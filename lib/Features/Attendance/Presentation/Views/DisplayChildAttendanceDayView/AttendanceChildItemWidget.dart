import 'package:flutter/material.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';

class  AttendanceChildItemWidget extends StatelessWidget {
  AttendanceChildItemWidget({
    required this.image,
    required this.name,
    required this.kg,
    required this.date,
    required this.status,
});
  String image;
  String name;
  String kg;
  String status;
  String date;

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xFFAC8FCF),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(bottom: 20,left: 20,right: 20,top: 30),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  height: 100, width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: NetworkImage(image,),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(Icons.person),
                        const SizedBox(
                          width: 20,
                        ),
                        TextWidget(
                          text:name,
                          color:const Color(0xFF7DA4FF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(Icons.school),
                        const SizedBox(
                          width: 20,
                        ),
                        TextWidget(
                          text: kg,
                          color:const Color(0xFF7DA4FF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(Icons.calendar_today),
                        const SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                          text: date,
                          color:const Color(0xFF7DA4FF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                          text: status,
                          color:const Color(0xFF7DA4FF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
