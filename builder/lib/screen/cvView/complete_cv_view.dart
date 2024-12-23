import 'package:builder/model/CV/cvitem.dart';
import 'package:builder/screen/cvform/cv_form_second_page.dart';
import 'package:builder/screen/mainpage/mainscreen.dart';
import 'package:builder/screen/style/right_style_small.dart';
import 'package:zoom_widget/zoom_widget.dart';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/screen/style/right_style.dart';
import 'package:flutter/material.dart';

class CompleteCvView extends StatelessWidget {
  const CompleteCvView({
    super.key,
    required this.thirdDetail,
  });
  final ThirdDetail thirdDetail;

  //List<ThirdDetail> detail = [];
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      switch (thirdDetail.secondDetail.personalDetail.cvStyle.name) {
        case 'RightStyle':
          return CompactRightStyle(
            thirdDetail: thirdDetail,
          );
        case 'LeftStyle':
          return const Text('GG');
        default:
          return const Text('hh');
      }
    });
  }
}
