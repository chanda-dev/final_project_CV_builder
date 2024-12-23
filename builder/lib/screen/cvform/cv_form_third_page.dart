import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/model/PersonalDetail/reference.dart';
import 'package:builder/model/PersonalDetail/skill.dart';
import 'package:builder/screen/cvView/cv_view.dart';
import 'package:builder/screen/cvform/cv_form_second_page.dart';
import 'package:builder/screen/cvform/reference_form.dart';
import 'package:builder/screen/cvform/refrence_display.dart';
import 'package:builder/screen/cvform/skill_display.dart';
import 'package:builder/screen/cvform/skill_form.dart';
import 'package:builder/screen/test/design.dart';
import 'package:flutter/material.dart';

class CvFormThirdPage extends StatefulWidget {
  const CvFormThirdPage({super.key, required this.secondDetail});
  final SecondDetail secondDetail;

  @override
  State<CvFormThirdPage> createState() => _CvFormThirdPageState();
}

class _CvFormThirdPageState extends State<CvFormThirdPage> {
  Mode mode = Mode.creating;
  List<Skill> skills = [];
  List<Reference> references = [];
  void submit() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CvView(
                  thirdDetail: ThirdDetail(
                      secondDetail: widget.secondDetail,
                      skills: skills,
                      references: references),
                  mode: Mode.creating,
                )));
  }

  double setSkillHeight() {
    double height;
    if (skills.isEmpty) {
      height = 0;
    } else {
      height =
          (skills.length.toDouble() * 150) - (skills.length.toDouble() * 30);
    }
    return height;
  }

  double setReferenceHeight() {
    double height;
    if (references.isEmpty) {
      height = 0;
    } else {
      height = (references.length.toDouble() * 150) -
          (references.length.toDouble() * 30);
    }
    return height;
  }

  void addSkill() async {
    final skillItem = await Navigator.of(context).push<Skill>(
        MaterialPageRoute(builder: (ctx) => SkillForm(mode: mode)));
    if (skillItem != null) {
      setState(() {
        skills.add(skillItem);
      });
    }
  }

  void onEditSkill(int index) async {
    final editItem = await Navigator.of(context).push<Skill>(MaterialPageRoute(
        builder: (ctx) => SkillForm(
              mode: Mode.editing,
              skill: skills[index],
            )));
    if (editItem != null) {
      setState(() {
        skills[index] = editItem;
      });
    }
  }

  void addReference() async {
    final referenceItem = await Navigator.of(context).push<Reference>(
        MaterialPageRoute(builder: (ctx) => ReferenceForm(mode: mode)));
    if (referenceItem != null) {
      setState(() {
        references.add(referenceItem);
      });
    }
  }

  void onEditReference(int index) async {
    final editReferenceItem =
        await Navigator.of(context).push<Reference>(MaterialPageRoute(
            builder: (ctx) => ReferenceForm(
                  mode: Mode.editing,
                  reference: references[index],
                )));
    if (editReferenceItem != null) {
      setState(() {
        references[index] = editReferenceItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  print(widget.secondDetail.education.length);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xff009EE2),
                )),
            const Text(
              'Skill and Reference',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xff009EE2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          //scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      'Personal Skill',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent.shade700),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: Text(
                          skills.isEmpty ? 'Add Skill' : 'Add More Skills'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff009EE2),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: addSkill,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: SkillDisplay(
                      skills: skills,
                      setHeight: setSkillHeight(),
                      onEditSkill: onEditSkill),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      'Reference',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent.shade700),
                    ),
                    const SizedBox(
                      width: 85,
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: Text(references.isEmpty
                          ? 'Add Reference'
                          : 'Add More References'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff009EE2),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: addReference,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: RefrenceDisplay(
                      references: references,
                      setHeight: setReferenceHeight(),
                      onEditReference: onEditReference),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
