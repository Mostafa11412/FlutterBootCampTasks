import 'package:flutter/material.dart';

class OnlineImage extends StatelessWidget {
  const OnlineImage({super.key});

  @override
  Widget build(BuildContext context) {
    //online image from src url using image.network widget  with adjusting width and height.
    return Image.network(
      "https://picsum.photos/200",
      width: 150,
      height: 150,
    );
  }
}
