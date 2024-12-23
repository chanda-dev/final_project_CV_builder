import 'package:builder/model/CL/clitem.dart';
import 'package:builder/model/CV/cvitem.dart';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/screen/homepage/clstyleitem.dart';
import 'package:builder/screen/homepage/cvstyleitem.dart';
import 'package:builder/screen/homepage/save_work.dart';
import 'package:flutter/material.dart';

enum ClOrCv { cl, cv }

class Homepagescreen extends StatelessWidget {
  const Homepagescreen(
      {super.key,
      required this.cvStyles,
      required this.clStyles,
      required this.onCvChoose,
      required this.onClChoose,
      required this.viewAllCv,
      required this.viewAllCl,
      required this.thirdDetail,
      required this.onDelete,
      required this.onViewWork});
  final List<CvStyle> cvStyles;
  final List<ClStyle> clStyles;
  final Function(CvStyle) onCvChoose;
  final Function(ClStyle) onClChoose;
  final VoidCallback viewAllCv;
  final VoidCallback viewAllCl;
  final List<ThirdDetail> thirdDetail;
  final Function(int?) onDelete;
  final Function(int?) onViewWork;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Let build your CV and CL by just one click',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Choose your CV style',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                    onPressed: viewAllCv, icon: const Icon(Icons.arrow_forward))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.9,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cvStyles.length,
                  itemBuilder: (context, index) => Cvstyleitem(
                        cvStyles[index],
                        onCvClick: () => onCvChoose(cvStyles[index]),
                      )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Choose your CL style',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                    onPressed: viewAllCl, icon: const Icon(Icons.arrow_forward))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.9,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: clStyles.length,
                  itemBuilder: (context, index) => Clstyleitem(
                        clStyles[index],
                        onClClick: () => onClChoose(clStyles[index]),
                      )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your Work',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                    onPressed: viewAllCv, icon: const Icon(Icons.arrow_forward))
              ],
            ),
            Builder(builder: (BuildContext context) {
              if (thirdDetail.isEmpty) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 250,
                    padding: const EdgeInsets.only(left: 10),
                    child: Center(child: Text('You do not have any project')),
                  ),
                );
              }
              return SizedBox(
                height: 400,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: thirdDetail.length,
                    itemBuilder: (context, index) => SaveWork(
                        thirdDetail: thirdDetail[index],
                        onViewClick: () => onViewWork(index),
                        onDelete: () => onDelete(index))),
              );
            })
          ],
        ),
      ),
    );
  }
}
