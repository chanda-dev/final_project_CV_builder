import 'package:builder/model/CL/clitem.dart';
import 'package:builder/model/CV/cvitem.dart';
import 'package:builder/screen/homepage/cvstyleitem.dart';
import 'package:builder/screen/homepage/homepagescreen.dart';
import 'package:flutter/material.dart';

class AllCvClView extends StatelessWidget {
  final ClOrCv clOrCv;
  final List<CvStyle>? cvStyle;
  final List<ClStyle>? clStyle;
  final Function(CvStyle)? onCvClick;
  final Function(ClStyle)? onClClick;
  const AllCvClView(
      {super.key,
      required this.clOrCv,
      this.cvStyle,
      this.clStyle,
      this.onCvClick,
      this.onClClick});

  @override
  Widget build(BuildContext context) {
    if (clOrCv == ClOrCv.cv) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Choose one'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                ...cvStyle!.map((item) => TextButton(
                      onPressed: () => onCvClick!(item),
                      child: Column(
                        //scrollDirection: Axis.vertical,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3.4,
                            //width: 150,
                            child: item.image,
                          ),
                          Text(
                            item.name,
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 12,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose CL'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              ...clStyle!.map((item) => TextButton(
                    onPressed: () => onClClick!(item),
                    child: Column(
                      //scrollDirection: Axis.vertical,
                      children: [
                        SizedBox(
                          height: 210,
                          child: item.image,
                        ),
                        Text(
                          item.name,
                          style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
