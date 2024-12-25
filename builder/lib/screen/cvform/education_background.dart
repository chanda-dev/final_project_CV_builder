import 'package:builder/model/PersonalDetail/education.dart';
import 'package:builder/screen/cvform/cv_form_second_page.dart';
import 'package:builder/widget/input_field.dart';
import 'package:builder/widget/text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class EducationBackground extends StatefulWidget {
  const EducationBackground({super.key, required this.mode, this.education});
  final Mode mode;
  final Education? education;

  @override
  State<EducationBackground> createState() => _EducationBackgroundState();
}

class _EducationBackgroundState extends State<EducationBackground> {
  final globalKey = GlobalKey<FormState>();
  DateFormat formatDate = DateFormat('yyyy-MM-dd');
  String degree = '';
  String major = '';
  String college = '';
  String collegeCountry = '';
  String collegeDescription = '';
  DateTime startCollegeDate = DateTime.now();
  DateTime endCollegeDate = DateTime.now();

  String? onValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill the form ';
    }
    return null;
  }

  void onConfirmAddEducation() {
    bool isvalid = globalKey.currentState!.validate();
    if (isvalid) {
      globalKey.currentState!.save();
      final newItem = Education(
          degree: degree,
          college: college,
          startDateTime: startCollegeDate,
          description: collegeDescription,
          collegeCountry: collegeCountry,
          endDateTime: endCollegeDate,
          major: major);
      Navigator.of(context).pop(newItem);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.mode == Mode.editing) {
      degree = widget.education!.degree!;
      major = widget.education!.major;
      college = widget.education!.college;
      collegeCountry = widget.education!.collegeCountry;
      collegeDescription = widget.education!.description;
      startCollegeDate = widget.education!.startDateTime;
      endCollegeDate = widget.education!.endDateTime;
    } else {
      degree = '';
      major = '';
      college = '';
      collegeCountry = '';
      collegeDescription = '';
      startCollegeDate = DateTime.now();
      endCollegeDate = DateTime.now();
    }
  }

  void onCacelAdd() {
    Navigator.pop(context);
  }

  void pickDate(DateTime dates) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1888, 3, 5),
        maxTime: DateTime.now(), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      if (dates == startCollegeDate) {
        setState(() {
          startCollegeDate = date;
        });
      } else {
        setState(() {
          endCollegeDate = date;
        });
      }
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  @override
  Widget build(BuildContext context) {
    bool? isCreating = widget.mode == Mode.creating;

    return Scaffold(
      backgroundColor: Color(0xff3EB489),
      appBar: AppBar(
        title: Text(isCreating ? 'Add Education' : 'Edit Education'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                const Text('Education Backgroud'),
                TextFormInput(
                    label: 'Degree',
                    lenght: 50,
                    validate: onValidate,
                    save: (value) {
                      degree = value!;
                    },
                    inputValue: degree),
                TextFormInput(
                    label: 'Major',
                    lenght: 50,
                    validate: onValidate,
                    save: (value) {
                      major = value!;
                    },
                    inputValue: major),
                TextFormInput(
                    label: 'College',
                    lenght: 50,
                    validate: onValidate,
                    save: (value) {
                      college = value!;
                    },
                    inputValue: college),
                TextFormInput(
                    label: 'Country',
                    lenght: 50,
                    validate: onValidate,
                    save: (value) {
                      collegeCountry = value!;
                    },
                    inputValue: collegeCountry),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text('College Start Date'),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                    TextButton(
                        onPressed: () => pickDate(startCollegeDate),
                        child: Text(formatDate.format(startCollegeDate))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text('College Graduation Date'),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                    TextButton(
                        onPressed: () => pickDate(endCollegeDate),
                        child: Text(formatDate.format(endCollegeDate))),
                  ],
                ),
                TextFormInput(
                    label: 'Description',
                    lenght: 500,
                    validate: onValidate,
                    save: (value) {
                      collegeDescription = value!;
                    },
                    inputValue: collegeDescription),
                Row(
                  children: [
                    TextButton(
                        onPressed: onCacelAdd,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                              color: Color.fromARGB(255, 99, 44, 209),
                              fontSize: 16),
                        )),
                    TextButton(
                        onPressed: onConfirmAddEducation,
                        child: Text(
                          isCreating ? 'Add' : 'Edit',
                          style: TextStyle(
                              color: Color.fromARGB(255, 99, 44, 209),
                              fontSize: 16),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
