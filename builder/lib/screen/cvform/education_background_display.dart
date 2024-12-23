import 'package:builder/model/PersonalDetail/education.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EducationBackgroundDisplay extends StatelessWidget {
  const EducationBackgroundDisplay(
      {super.key,
      required this.educations,
      required this.setHeight,
      required this.onEditEducationBackground,
      required this.formatDate,
      required this.onDelete});
  final List<Education> educations;
  final DateFormat formatDate;
  final double Function(int) setHeight;
  final Function(int) onEditEducationBackground;
  final Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    if (educations.isEmpty) {
      return SizedBox(
        height: setHeight(educations.length) + 200,
        child: Center(
          child: Text('Add some Background',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Color(0xff009EE2),
              )),
        ),
      );
    } else {
      return SizedBox(
        height: setHeight(educations.length),
        child: ListView.builder(
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: educations.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Education background ${index + 1}'),
                          TextButton.icon(
                              onPressed: () => onEditEducationBackground(index),
                              label: const Row(
                                children: [Text("Edit"), Icon(Icons.edit)],
                              )),
                          TextButton.icon(
                              onPressed: () => onDelete(index),
                              label: const Row(
                                children: [Text('Delete'), Icon(Icons.delete)],
                              ))
                        ],
                      ),
                      Text('Degree: ${educations[index].degree}'),
                      Text('College: ${educations[index].college}'),
                      Text('Country: ${educations[index].collegeCountry}'),
                      Text('Description: ${educations[index].description}'),
                      Text(
                          'Start Date: ${formatDate.format(educations[index].startDateTime)}'),
                      Text(
                          'End Date: ${formatDate.format(educations[index].endDateTime)}'),
                    ],
                  ),
                )),
      );
    }
  }
}
