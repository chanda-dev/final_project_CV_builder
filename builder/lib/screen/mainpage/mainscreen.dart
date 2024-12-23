import 'package:builder/model/CL/clitem.dart';
import 'package:builder/model/CV/cvitem.dart';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/screen/clform/cl_form.dart';
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
      image: Image.asset(
        'assets/rightCyanStyle.jpg',
        fit: BoxFit.fitWidth,
      ),
      name: 'RightStyle',
    ),
    CvStyle(
      image: Image.asset('assets/leftBlueStyle.jpg', fit: BoxFit.fitWidth),
      name: 'LefttStyle',
    ),
    CvStyle(
      image: Image.asset('assets/rightCyanStyle.jpg', fit: BoxFit.fitWidth),
      name: 'RightStyle',
    ),
    CvStyle(
      image: Image.asset('assets/leftBlueStyle.jpg', fit: BoxFit.fitWidth),
      name: 'LefttStyle',
    ),
    CvStyle(
      image: Image.asset('assets/rightCyanStyle.jpg', fit: BoxFit.fitWidth),
      name: 'RightStyle',
    ),
    CvStyle(
      image: Image.asset('assets/leftBlueStyle.jpg', fit: BoxFit.fitWidth),
      name: 'LefttStyle',
    ),
    CvStyle(
      image: Image.asset('assets/rightCyanStyle.jpg', fit: BoxFit.fitWidth),
      name: 'RightStyle',
    ),
    CvStyle(
      image: Image.asset('assets/leftBlueStyle.jpg', fit: BoxFit.fitWidth),
      name: 'LefttStyle',
    ),
    CvStyle(
      image: Image.asset('assets/rightCyanStyle.jpg', fit: BoxFit.fitWidth),
      name: 'RightStyle',
    ),
    CvStyle(
      image: Image.asset('assets/leftBlueStyle.jpg', fit: BoxFit.fitWidth),
      name: 'LefttStyle',
    ),
  ];
  List<ClStyle> clStyles = [
    ClStyle(
      image: Image.asset('assets/nomal1.jpg'),
      name: 'nomal1',
    ),
    ClStyle(
      image: Image.asset('assets/nomal.jpg'),
      name: 'nomal',
    ),
  ];

  // final List<Personaldetail> _personalDetail = [];
  // final List<ThirdDetail> _detail = [];

  // void onCreatedCv(Personaldetail newPersonalDetail) {
  //   setState(() {
  //     _personalDetail.add(newPersonalDetail);
  //   });
  // }
  void delete(int? index) {
    print(detail.length);
    setState(() {
      detail.removeAt(index!);
    });
    print('after');
    print(detail.length);
  }

  void viewWork(int? index) {
    if (detail.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => CvView(
                    thirdDetail: detail[index!],
                    mode: Mode.view,
                  )));
    }
  }

  void onViewAllCv() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => AllCvClView(
              clOrCv: ClOrCv.cv,
              cvStyle: cvStyles,
              onCvClick: onCvChooseClick,
            )));
  }

  void onViewAllCl() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => AllCvClView(
              clOrCv: ClOrCv.cl,
              clStyle: clStyles,
              onClClick: onClChooseClick,
            )));
  }

  // when click on any style it will display the modal that have comfirmation to choose that CV style or not
  void onCvChooseClick(CvStyle cv) {
    showDialog(
        context: context,
        builder: (ctx) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Do you want to choose this style',
                      style: TextStyle(
                          color: Colors.grey,
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
            ));
  }

  // the same as onCvChooseClick but work on Cl

  void onClChooseClick(ClStyle cl) {
    showDialog(
        context: context,
        builder: (ctx) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Do you want to choose this style',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            decoration: TextDecoration.none)),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: cl.image,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: onCancel, child: const Text('cancel')),
                        TextButton(
                            onPressed: () => onConfirmCl(cl),
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

  void onConfirmCl(ClStyle cl) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ClForm(
                  clStyle: cl,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to CV builder',
            style: TextStyle(
                color: Colors.white, decoration: TextDecoration.none)),
        backgroundColor: Colors.black,
      ),
      body: Homepagescreen(
        cvStyles: cvStyles,
        clStyles: clStyles,
        onCvChoose: onCvChooseClick,
        onClChoose: onClChooseClick,
        viewAllCv: onViewAllCv,
        viewAllCl: onViewAllCl,
        thirdDetail: detail,
        onDelete: delete,
        onViewWork: viewWork,
      ),
    );
  }
}
