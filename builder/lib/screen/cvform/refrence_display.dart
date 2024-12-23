import 'package:builder/model/PersonalDetail/reference.dart';
import 'package:builder/model/PersonalDetail/skill.dart';
import 'package:flutter/material.dart';

class RefrenceDisplay extends StatelessWidget {
  const RefrenceDisplay(
      {super.key,
      required this.references,
      required this.setHeight,
      required this.onEditReference});
  final List<Reference> references;

  final double setHeight;
  final Function(int) onEditReference;

  @override
  Widget build(BuildContext context) {
    if (references.isEmpty) {
      return SizedBox(
        height: setHeight + 200,
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
        height: setHeight,
        child: ListView.builder(
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: references.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Reference ${index + 1}'),
                          TextButton.icon(
                              onPressed: () => onEditReference(index),
                              label: const Row(
                                children: [Text("Edit"), Icon(Icons.edit)],
                              ))
                        ],
                      ),
                      Text('Name: ${references[index].name}'),
                      Text('Job: ${references[index].job}'),
                      Text('Phone Number: ${references[index].number}'),
                      Text('Emal: ${references[index].email}'),
                    ],
                  ),
                )),
      );
    }
  }
}
