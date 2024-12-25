import 'package:builder/model/PersonalDetail/skill.dart';
import 'package:flutter/material.dart';

class SkillDisplay extends StatelessWidget {
  const SkillDisplay(
      {super.key,
      required this.skills,
      required this.setHeight,
      required this.onEditSkill,
      required this.onDeleteSkill});
  final List<Skill> skills;

  final double setHeight;
  final Function(int) onEditSkill;
  final Function(int) onDeleteSkill;

  @override
  Widget build(BuildContext context) {
    if (skills.isEmpty) {
      return SizedBox(
        height: setHeight + 200,
        child: Center(
          child: Text('Add some Skill',
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
            physics: const NeverScrollableScrollPhysics(),
            itemCount: skills.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Skill ${index + 1}'),
                          TextButton.icon(
                              onPressed: () => onEditSkill(index),
                              label: const Row(
                                children: [
                                  Text(
                                    "Edit",
                                    style: TextStyle(color: Color(0xff009EE2)),
                                  ),
                                  Icon(
                                    Icons.edit,
                                    color: Color(0xff009EE2),
                                  )
                                ],
                              )),
                          TextButton.icon(
                              onPressed: () => onDeleteSkill(index),
                              label: const Row(
                                children: [
                                  Text(
                                    "Delete",
                                    style: TextStyle(color: Color(0xff009EE2)),
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color: Color(0xff009EE2),
                                  )
                                ],
                              ))
                        ],
                      ),
                      Text('Name: ${skills[index].yourSkill}'),
                      Text('Rate: ${skills[index].rate}'),
                    ],
                  ),
                )),
      );
    }
  }
}
