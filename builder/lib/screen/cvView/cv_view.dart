import 'package:builder/screen/cvform/cv_form.dart';
import 'package:builder/screen/cvform/cv_form_second_page.dart';
import 'package:builder/screen/mainpage/mainscreen.dart';
import 'package:builder/screen/style/yellow_top_right.dart';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/screen/style/right_style.dart';
import 'package:flutter/material.dart';

class CvView extends StatefulWidget {
  const CvView(
      {super.key,
      required this.thirdDetail,
      required this.mode,
      required this.index,
      this.anotherMode});
  final ThirdDetail thirdDetail;
  final Mode? anotherMode;
  final Mode mode;
  final int index;
  @override
  State<CvView> createState() => _CvViewState();
}

class _CvViewState extends State<CvView> {
  void save() {
    if (widget.anotherMode == Mode.editing) {
      final editDetail = ThirdDetail(
          secondDetail: widget.thirdDetail.secondDetail,
          skills: widget.thirdDetail.skills,
          references: widget.thirdDetail.references);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.of(context).pop(editDetail);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx) => Mainscreen()),
        (Route<dynamic> route) => false, // Remove all previous routes
      );
    } else {
      print(detail.length);
      // Navigator.push(context, MaterialPageRoute(builder: (ctx) => Mainscreen()));

      setState(() {
        detail.add(widget.thirdDetail);
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (ctx) => Mainscreen()));
      });

      print('after');
      print(detail.length);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx) => Mainscreen()),
        (Route<dynamic> route) => false, // Remove all previous routes
      );
    }
  }

  void edit() async {
    if (detail.isNotEmpty && widget.index >= 0) {
      final editDetail =
          await Navigator.of(context).push<ThirdDetail>(MaterialPageRoute(
              builder: (ctx) => CvForm(
                    cvStyle: detail[widget.index]
                        .secondDetail
                        .personalDetail
                        .cvStyle,
                    mode: Mode.editing,
                    thirdDetail: detail[widget.index],
                  )));
      if (editDetail != null) {
        setState(() {
          detail[widget.index] = editDetail;
        });
      }
    }
  }

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
              case 'yellowTopRight':
                return YellowTopRight(
                  thirdDetail: widget.thirdDetail,
                );
              default:
                return const Text('hh');
            }
          }),
        ));
  }
}
