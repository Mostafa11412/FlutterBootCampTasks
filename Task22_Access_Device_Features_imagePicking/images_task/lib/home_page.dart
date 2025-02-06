import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker picker = ImagePicker();

  List<XFile>? images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('images Task'),
      ),
      body: Center(
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            images == null
                ? Text("No images Selected yet.")
                : Column(
                    spacing: 5,
                    children: [
                      Text(
                        "Swipe Righrt -->",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 400,
                        width: 380,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: images!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 380,
                              height: 400,
                              child: Image.file(
                                File(images![index].path),
                                fit: BoxFit.fitHeight,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
            FilledButton(
                onPressed: () async {
                  images = await picker.pickMultiImage();
                  setState(() {});
                },
                child: Text("Pick Image"))
          ],
        ),
      ),
    );
  }
}
