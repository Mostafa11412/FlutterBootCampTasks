import 'package:flutter/material.dart';

class OfflineImage extends StatelessWidget {
  const OfflineImage({super.key});

  @override
  Widget build(BuildContext context) {
    //offline image from assets using image.asset widget with adjusting width and height.
    return Image.asset(
      "assets/sprintsIcon.png",
      width: 150,
      height: 150,
    );
  }
}
