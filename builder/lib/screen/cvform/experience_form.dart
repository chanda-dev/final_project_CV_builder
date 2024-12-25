import 'package:builder/model/PersonalDetail/experience.dart';
import 'package:builder/screen/cvform/cv_form_second_page.dart';
import 'package:builder/widget/input_field.dart';
import 'package:builder/widget/text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class ExperienceForm extends StatefulWidget {
  const ExperienceForm({
    super.key,
    required this.mode,
    this.experience,
  });
  final Mode mode;
  final Experience? experience;

  @override
  State<ExperienceForm> createState() => _ExperienceFormState();
}

class _ExperienceFormState extends State<ExperienceForm> {
  final DateFormat formatDate = DateFormat('yyyy-MM-dd');
  final globalKey = GlobalKey<FormState>();
  String companyName = '';
  String companyCountry = '';
  String role = '';
  String expDescription = '';
  DateTime expStartDate = DateTime.now();
  DateTime expEndDate = DateTime.now();
  String? onValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill the form ';
    }
    return null;
  }

  void pickDate(DateTime dates) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1888, 3, 5),
        maxTime: DateTime(2030, 12, 1), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      if (dates == expStartDate) {
        setState(() {
          expStartDate = date;
        });
      } else {
        setState(() {
          expEndDate = date;
        });
      }
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  void confirmAdd() {
    bool isvalid = globalKey.currentState!.validate();
    if (isvalid) {
      globalKey.currentState!.save();
      final newItem = Experience(
        description: expDescription,
        companyName: companyName,
        companyCountry: companyCountry,
        startDate: expStartDate,
        endDate: expEndDate,
        expRole: role,
      );
      Navigator.of(context).pop(newItem);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.mode == Mode.editing) {
      companyName = widget.experience!.companyName;
      companyCountry = widget.experience!.companyCountry;
      expDescription = widget.experience!.description;
      role = widget.experience!.expRole;
      expStartDate = widget.experience!.startDate;
      expEndDate = widget.experience!.endDate;
    } else {
      companyName = '';
      companyCountry = '';
      expDescription = '';
      role = '';
      expStartDate = DateTime.now();
      expEndDate = DateTime.now();
    }
  }

  void cancelAdd() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    bool isCreating = widget.mode == Mode.creating;
    return Scaffold(
      backgroundColor: Color(0xff3EB489),
      appBar: AppBar(
        title: Text(isCreating ? 'Add Experience' : 'Edit Experience'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              const Text('Experience'),
              TextFormInput(
                  label: 'Company Name',
                  lenght: 50,
                  validate: onValidate,
                  save: (value) {
                    companyName = value!;
                  },
                  inputValue: companyName),
              TextFormInput(
                  label: 'Company Country',
                  lenght: 50,
                  validate: onValidate,
                  save: (value) {
                    companyCountry = value!;
                  },
                  inputValue: companyCountry),
              TextFormInput(
                  label: 'Role',
                  lenght: 50,
                  validate: onValidate,
                  save: (value) {
                    role = value!;
                  },
                  inputValue: role),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text('Experience Start Date'),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                  TextButton(
                      onPressed: () => pickDate(expStartDate),
                      child: Text(formatDate.format(expStartDate))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text('Experience End date'),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                  TextButton(
                      onPressed: () => pickDate(expEndDate),
                      child: Text(formatDate.format(expEndDate))),
                ],
              ),
              TextFormInput(
                  label: 'Description',
                  lenght: 500,
                  validate: onValidate,
                  save: (value) {
                    expDescription = value!;
                  },
                  inputValue: expDescription),
              Row(
                children: [
                  TextButton(
                      onPressed: cancelAdd,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: Color.fromARGB(255, 99, 44, 209),
                            fontSize: 16),
                      )),
                  TextButton(
                      onPressed: confirmAdd,
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
    );
  }
}
