import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:flutter/material.dart';

class Design extends StatelessWidget {
  const Design({super.key, required this.thirdDetail});

  final ThirdDetail thirdDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Column(
          children: [
            Container(
              child: thirdDetail.secondDetail.personalDetail.cvStyle.image,
            ),
            Text(' Name ${thirdDetail.secondDetail.personalDetail.firstName}'),
            ListView.builder(
                itemCount: thirdDetail.secondDetail.education.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                          'Degree: ${thirdDetail.secondDetail.education[index].degree}'),
                    ],
                  );
                }),
            ListView.builder(
                itemCount: thirdDetail.skills.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text('Name: ${thirdDetail.skills[index].yourSkill}')
                    ],
                  );
                })
          ],
        ));
  }
}
