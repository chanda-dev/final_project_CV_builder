import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/screen/cvView/complete_cv_view.dart';
import 'package:flutter/material.dart';

class SaveWork extends StatelessWidget {
  const SaveWork(
      {super.key,
      required this.thirdDetail,
      required this.onViewClick,
      required this.onDelete});
  final ThirdDetail thirdDetail;
  final VoidCallback onViewClick;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
            width: 200,
            height: 350,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            color: const Color.fromARGB(255, 213, 209, 197),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(
                //   // height: 120,
                //   // width: 180,
                //   child: CompleteCvView(thirdDetail: thirdDetail),
                // ),
                CompleteCvView(thirdDetail: thirdDetail),
                Text(thirdDetail.secondDetail.personalDetail.cvStyle.name),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: onDelete,
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xff009EE2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.5))),
                        child: Text('Delete')),
                    ElevatedButton(
                      onPressed: onViewClick,
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Color(0xff009EE2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.5))),
                      child: Text('View'),
                    )
                  ],
                )
              ],
            )));
  }
}
