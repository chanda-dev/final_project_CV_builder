import 'package:flutter/material.dart';

class BuildImageSlider extends StatelessWidget {
  const BuildImageSlider({super.key, required this.image, required this.index});
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
