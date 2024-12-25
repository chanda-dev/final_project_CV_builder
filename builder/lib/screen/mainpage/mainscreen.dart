import 'package:builder/model/CV/cvitem.dart';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/screen/cvView/cv_view.dart';
import 'package:builder/screen/cvform/cv_form.dart';
import 'package:builder/screen/cvform/cv_form_second_page.dart';
import 'package:builder/screen/homepage/all_cv_cl_view.dart';
import 'package:builder/screen/homepage/homepagescreen.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({
    super.key,
  });
  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<CvStyle> cvStyles = [
    CvStyle(
      image: Image.asset('assets/leftBlueStyle.png', fit: BoxFit.fitWidth),
      name: 'RightStyle',
    ),
    CvStyle(
      image: Image.asset('assets/yellowTopRight.png', fit: BoxFit.fitWidth),
      name: 'yellowTopRight',
    ),
  ];
  List<String> slide = [
    'assets/decoration.webp',
    'assets/justInputTheForm.webp',
  ];
  void delete(int? index) {
    if (index! >= 0) {
      setState(() {
        detail.removeAt(index);
      });
    } else {
      print(index);
    }
  }

  void viewWork(int? index) {
    if (detail.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => CvView(
                    thirdDetail: detail[index!],
                    mode: Mode.view,
                    index: index,
                  )));
    }
  }

  void onViewAllCv() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => AllCvClView(
              cvStyle: cvStyles,
              onCvClick: onCvChooseClick,
              view: ViewDisplay.cv,
            )));
  }

  void onViewAllWork() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => AllCvClView(
                  view: ViewDisplay.project,
                  onProjectClick: viewWork,
                )));
  }

  // when click on any style it will display the modal that have comfirmation to choose that CV style or not
  void onCvChooseClick(CvStyle cv) {
    showDialog(
        context: context,
        builder: (ctx) => Dialog(
              //backgroundColor: Color(0xff3EB489),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                color: Color(0xff3EB489),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Do you want to choose this style',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            decoration: TextDecoration.none)),
                    SizedBox(
                      child: cv.image,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: onCancel, child: const Text('cancel')),
                        TextButton(
                            onPressed: () => onConfirmCv(cv),
                            child: const Text('Confirm')),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  // this function use for cancel or move back to privious the screen
  void onCancel() {
    Navigator.pop(context);
  }

  // use for when user confirm thier style
  void onConfirmCv(CvStyle cv) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CvForm(
                  cvStyle: cv,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to CV builder',
            style: TextStyle(
                color: Colors.white, decoration: TextDecoration.none)),
        backgroundColor: Color(0xff3EB489),
      ),
      body: Homepagescreen(
        cvStyles: cvStyles,
        onCvChoose: onCvChooseClick,
        viewAllCv: onViewAllCv,
        onDelete: delete,
        onViewWork: viewWork,
        viewAllProject: onViewAllWork,
        slide: slide,
      ),
    );
  }
}
