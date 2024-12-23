import 'package:builder/model/CV/cvitem.dart';
import 'package:builder/screen/cvform/cv_form_second_page.dart';
import 'package:builder/screen/mainpage/mainscreen.dart';
import 'package:zoom_widget/zoom_widget.dart';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/screen/style/right_style.dart';
import 'package:flutter/material.dart';

class CvView extends StatefulWidget {
  const CvView({super.key, required this.thirdDetail, required this.mode});
  final ThirdDetail thirdDetail;
  final Mode mode;

  @override
  State<CvView> createState() => _CvViewState();
}

class _CvViewState extends State<CvView> {
  void save() {
    detail.add(widget.thirdDetail);
    print(detail.length);
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => Mainscreen()));
    print('after');
    print(detail.length);
  }

  void edit() async {}

  //List<ThirdDetail> detail = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  label: Icon(
                    Icons.arrow_back,
                    color: Color(0xff009EE2),
                  )),
              Text(
                'Cv view',
                style: TextStyle(color: Colors.white),
              ),
              Builder(builder: (BuildContext context) {
                if (widget.mode == Mode.view) {
                  return ElevatedButton(
                    onPressed: edit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Color(0xFF009EE2),
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
                return ElevatedButton(
                  onPressed: save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Color(0xFF009EE2),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              })
            ],
          ),
        ),
        body: InteractiveViewer(
          child: Builder(builder: (BuildContext context) {
            switch (
                widget.thirdDetail.secondDetail.personalDetail.cvStyle.name) {
              case 'RightStyle':
                return RightStyle(
                  thirdDetail: widget.thirdDetail,
                );
              case 'LeftStyle':
                return const Text('GG');
              default:
                return const Text('hh');
            }
          }),
        ));
  }
}
