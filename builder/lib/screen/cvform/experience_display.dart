import 'package:builder/model/PersonalDetail/experience.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExperienceDisplay extends StatelessWidget {
  const ExperienceDisplay(
      {super.key,
      required this.experience,
      required this.formatDate,
      required this.setHeight,
      required this.onEditExperience,
      required this.onDelete});
  final List<Experience> experience;
  final DateFormat formatDate;
  final double Function(int) setHeight;
  final Function(int) onEditExperience;
  final Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    if (experience.isEmpty) {
      return SizedBox(
        height: setHeight(experience.length) + 200,
        child: Center(
          child: Text('Add some Experience',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Color(0xff009EE2),
              )),
        ),
      );
    } else {
      return SizedBox(
        height: setHeight(experience.length),
        child: ListView.builder(
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: experience.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Experience ${index + 1}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                  onPressed: () => onEditExperience(index),
                                  label: const Row(
                                    children: [Text("Edit"), Icon(Icons.edit)],
                                  )),
                              TextButton.icon(
                                  onPressed: () => onDelete(index),
                                  label: const Row(
                                    children: [
                                      Text('Delete'),
                                      Icon(Icons.delete)
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      ),
                      Text('Name: ${experience[index].companyName}'),
                      Text('City: ${experience[index].companyCountry}'),
                      Text('Description: ${experience[index].description}'),
                      Text('Role: ${experience[index].expRole}'),
                      Text(
                          'Start Date: ${formatDate.format(experience[index].startDate)}'),
                      Text(
                          'End Date: ${formatDate.format(experience[index].endDate)}'),
                    ],
                  ),
                )),
      );
    }
  }
}
