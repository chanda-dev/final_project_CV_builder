import 'package:flutter/material.dart';

enum Hobbies {
  music,travel,football,game,tennis,
}
class Hobbie {
  final Hobbies hobbieName;
  final Icon hobbieIcon;

  Hobbie({required this.hobbieName, required this.hobbieIcon});
}