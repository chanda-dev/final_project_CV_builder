import 'package:builder/model/CL/clitem.dart';
import 'package:flutter/material.dart';

class ClForm extends StatelessWidget {
  const ClForm({super.key, required this.clStyle});
  final ClStyle clStyle;

  @override
  Widget build(BuildContext context) {
    if (clStyle.name == 'RightStyle') {
      return Scaffold(
        appBar: AppBar(
          title: Text('This is a'),
        ),
        body: Container(
          child: clStyle.image,
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('This is b'),
        ),
        body: Container(
          child: clStyle.image,
        ),
      );
    }
  }
}
