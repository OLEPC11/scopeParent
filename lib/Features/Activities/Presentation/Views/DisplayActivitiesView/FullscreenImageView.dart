import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scope_parent/Features/Activities/Data/Model/ActivitiesModel.dart';

import '../../../../../main.dart';

class FullscreenImageView extends StatefulWidget {
  final List<ActivityImage> imagePaths;

  FullscreenImageView({required this.imagePaths});

  @override
  _FullscreenImageViewState createState() => _FullscreenImageViewState();
}

class _FullscreenImageViewState extends State<FullscreenImageView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Semi-transparent background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 12,
            child: Hero(
              tag: widget.imagePaths[currentIndex].imageName, // Display current image
              child: Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFFAC8FCF),
                  ),
                  borderRadius: BorderRadius.circular(60),
                ),
                margin: const EdgeInsets.only(bottom: 185,left: 20,right: 20,top:185),
                child:Container(
                  height: 160,
                  width: 440,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    image: DecorationImage(
                      image:  NetworkImage(
                        "http://$ipServer:8000/${widget.imagePaths[currentIndex].imagePath}/${widget.imagePaths[currentIndex].imageName}",
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      currentIndex = max(currentIndex - 1, 0); // Go to previous image or stay at first
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      currentIndex = min(currentIndex + 1, widget.imagePaths.length - 1); // Go to next image or stay at last
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
