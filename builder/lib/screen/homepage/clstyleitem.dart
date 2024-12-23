import 'package:builder/model/CL/clitem.dart';
import 'package:builder/model/CV/cvitem.dart';
import 'package:flutter/material.dart';

class Clstyleitem extends StatelessWidget {
  Clstyleitem(this.clStyle, {super.key, required this.onClClick});
  ClStyle clStyle;
  final VoidCallback onClClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          color: Colors.amber,
          child: SizedBox(
              width: 100,
              child: TextButton(
                onPressed: onClClick,
                style: const ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent)),
                child: Column(
                  children: [
                    SizedBox(
                      child: clStyle.image,
                    ),
                    Text(clStyle.name)
                  ],
                ),
              )),
        ));
  }
}
