import 'package:builder/model/CV/cvitem.dart';
import 'package:flutter/material.dart';

class CvRightStyleForm extends StatelessWidget {
  const CvRightStyleForm({super.key, required this.cvStyle});
  final CvStyle cvStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cvStyle.image,
    );
  }
}
