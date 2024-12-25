import 'package:builder/model/CL/clitem.dart';
import 'package:builder/model/CV/cvitem.dart';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/screen/homepage/cvstyleitem.dart';
import 'package:builder/screen/homepage/homepagescreen.dart';
import 'package:builder/screen/homepage/save_work.dart';
import 'package:builder/screen/mainpage/mainscreen.dart';
import 'package:flutter/material.dart';

enum ViewDisplay { cv, project }

class AllCvClView extends StatefulWidget {
  final List<CvStyle>? cvStyle;
  final Function(CvStyle)? onCvClick;
  final Function(int)? onProjectClick;
  final ViewDisplay view;
  const AllCvClView({
    super.key,
    this.cvStyle,
    this.onCvClick,
    this.onProjectClick,
    required this.view,
  });

  @override
  State<AllCvClView> createState() => _AllCvClViewState();
}

class _AllCvClViewState extends State<AllCvClView> {
  void delete(int? index) {
    bool empty = false;
    if (detail.isNotEmpty) {
      setState(() {
        detail.removeAt(index!);
        empty = true;
      });
    } else {
      print(index);
    }
    if (empty == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => Mainscreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.view == ViewDisplay.cv) {
      return Scaffold(
        backgroundColor: Color(0xff3EB489),
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
                ...widget.cvStyle!.map((item) => TextButton(
                      onPressed: () => widget.onCvClick!(item),
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
      backgroundColor: Color(0xff3EB489),
      appBar: AppBar(
        title: const Text('Your Project'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width + 100,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 8, // Horizontal spacing
                mainAxisSpacing: 8, // Vertical spacing
                childAspectRatio: 0.5, // Adjust aspect ratio to fit content
              ),
              itemCount: detail.length,
              itemBuilder: (context, index) {
                return SaveWork(
                    thirdDetail: detail[index],
                    onViewClick: () => widget.onProjectClick!(index),
                    onDelete: () => delete(index));
              },
            ),
          ),
        ),
      ),
    );
  }
}
