import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:flutter/material.dart';

class CvStyle {
  final String name;
  final Image? image;

  CvStyle({
    required this.name,
    required this.image,
  });
}

class Cvitem {
  final List<Personaldetail> personalDetails;
  Cvitem({required this.personalDetails});
}
