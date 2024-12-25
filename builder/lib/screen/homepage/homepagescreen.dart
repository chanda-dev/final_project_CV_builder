import 'package:builder/model/CL/clitem.dart';
import 'package:builder/model/CV/cvitem.dart';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/screen/homepage/build_image_slider.dart';
import 'package:builder/screen/homepage/cvstyleitem.dart';
import 'package:builder/screen/homepage/save_work.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homepagescreen extends StatelessWidget {
  const Homepagescreen({
    super.key,
    required this.cvStyles,
    required this.onCvChoose,
    required this.viewAllCv,
    required this.onDelete,
    required this.onViewWork,
    required this.viewAllProject,
    required this.slide,
  });
  final List<CvStyle> cvStyles;
  final Function(CvStyle) onCvChoose;
  final VoidCallback viewAllCv;
  final VoidCallback viewAllProject;
  final Function(int?) onDelete;
  final Function(int?) onViewWork;
  final List<String> slide;
  @override
  Widget build(BuildContext context) {
    bool isDetailEmpty = detail.isEmpty;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Color(0xff3EB489)),
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: slide.length,
                  itemBuilder: (context, index, reallIndex) {
                    final pic = slide[index];
                    return BuildImageSlider(image: pic, index: index);
                  },
                  options: CarouselOptions(
                    height: 300,
                  ),
                ),
              ],
            )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Choose your CV style',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
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
                  'Your Project',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                if (!isDetailEmpty)
                  IconButton(
                    onPressed: viewAllProject,
                    icon: const Icon(Icons.arrow_forward),
                  ),
              ],
            ),
            Builder(builder: (BuildContext context) {
              if (isDetailEmpty) {
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
                height: 410,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: detail.length,
                    itemBuilder: (context, index) => SaveWork(
                        thirdDetail: detail[index],
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
