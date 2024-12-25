import 'package:builder/model/CV/cvitem.dart';
import 'package:flutter/material.dart';

class Cvstyleitem extends StatelessWidget {
  Cvstyleitem(this.cvStyle, {super.key, required this.onCvClick});
  CvStyle cvStyle;
  final VoidCallback onCvClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          //color: Colors.white,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: SizedBox(
              width: 100,
              child: TextButton(
                onPressed: onCvClick,
                style: const ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 180,
                      child: cvStyle.image,
                    ),
                    Text(cvStyle.name)
                  ],
                ),
              )),
        ));
  }
}
