
import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  SizedBoxWidget ({
    required this.height,
    required this.width,
    required this.edgeInsets,
    required this.child,
  });

  double height;
  double width;
  EdgeInsets edgeInsets;
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:edgeInsets,
      child: SizedBox(
        width: width,
        height: height,
        child:child,
      ),
    );
  }
}