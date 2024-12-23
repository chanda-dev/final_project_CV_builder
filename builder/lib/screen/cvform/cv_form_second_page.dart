import 'package:builder/widget/for_global_fuction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'education_background_display.dart';
import 'experience_display.dart';
import 'education_background.dart';
import 'experience_form.dart';
import 'cv_form_third_page.dart';
import '../../model/PersonalDetail/education.dart';
import '../../model/PersonalDetail/experience.dart';
import '../../model/PersonalDetail/personaldetail.dart';

enum Mode { editing, creating, delete, view }

class CvFormSecondPage extends StatefulWidget {
  const CvFormSecondPage({
    super.key,
    required this.personalDetail,
  });
  final Personaldetail personalDetail;

  @override
  State<CvFormSecondPage> createState() => _CvFormSecondPageState();
}

class _CvFormSecondPageState extends State<CvFormSecondPage> {
  Mode mode = Mode.creating;
  List<Education> education = [];
  List<Experience> experience = [];

  final DateFormat formatDate = DateFormat('yyyy-MM-dd');

  void onNextForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CvFormThirdPage(
          secondDetail: SecondDetail(
            education,
            experience,
            personalDetail: widget.personalDetail,
          ),
        ),
      ),
    );
  }

  void addEducation() async {
    final newItem = await Navigator.of(context).push<Education>(
      MaterialPageRoute(
        builder: (ctx) => EducationBackground(mode: mode),
      ),
    );
    if (newItem != null) {
      setState(() {
        education.add(newItem);
      });
    }
  }

  void onEditEducationBackground(int index) async {
    final editItem = await Navigator.of(context).push<Education>(
      MaterialPageRoute(
        builder: (ctx) => EducationBackground(
          mode: Mode.editing,
          education: education[index],
        ),
      ),
    );
    if (editItem != null) {
      setState(() {
        education[index] = editItem;
      });
    }
  }

  void addExperience() async {
    final newItem = await Navigator.of(context).push<Experience>(
      MaterialPageRoute(
        builder: (ctx) => ExperienceForm(mode: mode),
      ),
    );
    if (newItem != null) {
      setState(() {
        experience.add(newItem);
      });
    }
  }

  void onEditExperience(int index) async {
    final editExp = await Navigator.of(context).push<Experience>(
      MaterialPageRoute(
        builder: (ctx) => ExperienceForm(
          mode: Mode.editing,
          experience: experience[index],
        ),
      ),
    );
    if (editExp != null) {
      setState(() {
        experience[index] = editExp;
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
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xff009EE2),
                )),
            const Text(
              'CV Builder',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: onNextForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Color(0xFF009EE2),
              ),
              child: const Text(
                'next',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        //centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      'Education Background',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent.shade700),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: Text(education.isEmpty
                          ? 'Add Education'
                          : 'Add More Education'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff009EE2),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.5))),
                      onPressed: addEducation,
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
                  child: EducationBackgroundDisplay(
                    educations: education,
                    setHeight: setAllHeight,
                    onEditEducationBackground: onEditEducationBackground,
                    formatDate: formatDate,
                    onDelete: (index) =>
                        setState(() => education.removeAt(index)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      'Work Experience',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent.shade700),
                    ),
                    const SizedBox(width: 50),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: Text(experience.isEmpty
                          ? 'Add Experience'
                          : 'Add More Experience'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff009EE2),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.5))),
                      onPressed: addExperience,
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
                  child: ExperienceDisplay(
                    experience: experience,
                    formatDate: formatDate,
                    setHeight: setAllHeight,
                    onEditExperience: onEditExperience,
                    onDelete: (index) =>
                        setState(() => experience.removeAt(index)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
