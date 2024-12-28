import 'package:flutter/material.dart';
import 'package:the_first_flutter_project/customizedText.dart';
import 'package:the_first_flutter_project/offlineImage.dart';
import 'package:the_first_flutter_project/onlineImage.dart';

// Home page Widget consist of Scaffold
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //display home page title using appBar
      appBar: AppBar(
        title: const Text('My First Project'),
        centerTitle: true,
      ),
      //positioning column in center of screen by setting main axis alignment of both  column and row to center.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //gap between Row and text using seperator.
        children: [
          //Row of offline and online images using widget for each one.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OfflineImage(),

              //making gaps between images using sized box with setting WIDTH value.
              SizedBox(
                width: 16,
              ),
              OnlineImage(),
            ],
          ),

          //making gaps between images and text using sized box with setting HEIGHT value.
          SizedBox(
            height: 20,
          ),

          // customized text as widget.
          CustomizedText(),
        ],
      ),
    );
  }
}
