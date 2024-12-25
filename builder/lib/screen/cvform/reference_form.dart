import 'dart:math';

import 'package:builder/model/PersonalDetail/reference.dart';
import 'package:builder/model/PersonalDetail/skill.dart';
import 'package:builder/screen/cvform/cv_form_second_page.dart';
import 'package:builder/widget/input_field.dart';
import 'package:builder/widget/text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferenceForm extends StatefulWidget {
  ReferenceForm({
    super.key,
    required this.mode,
    this.reference,
  });
  final Mode mode;
  final Reference? reference;

  @override
  State<ReferenceForm> createState() => _ReferenceFormState();
}

class _ReferenceFormState extends State<ReferenceForm> {
  final globalkey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String job = '';
  String number = '';
  String? onValidate(String? value) {
    if (value == null || value.isEmpty || value.trim().length > 50) {
      return 'Please fill the form ';
    }
    return null;
  }

  void onConfirmAdd() {
    bool isvalid = globalkey.currentState!.validate();
    if (isvalid) {
      globalkey.currentState!.save();
      final referenceItem =
          Reference(name: name, email: email, job: job, number: number);
      Navigator.of(context).pop(referenceItem);
    }
  }

  void initState() {
    super.initState();
    if (widget.mode == Mode.editing) {
      name = widget.reference!.name;
      email = widget.reference!.email;
      job = widget.reference!.job;
      number = widget.reference!.number;
    } else {
      name = '';
      email = '';
      job = '';
      number = '';
    }
  }

  void onCacelAdd() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    bool isCreating = widget.mode == Mode.creating;
    return Scaffold(
      backgroundColor: Color(0xff3EB489),
      appBar: AppBar(
        title: Text(isCreating ? 'Add Skill' : 'Edit Skill'),
      ),
      body: Form(
        key: globalkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Reference'),
              TextFormInput(
                  label: "Name",
                  lenght: 50,
                  validate: onValidate,
                  save: (value) {
                    name = value!;
                  },
                  inputValue: name),
              TextFormInput(
                label: "Job",
                lenght: 50,
                validate: onValidate,
                save: (value) {
                  job = value!;
                },
                inputValue: job,
              ),
              TextFormInput(
                  label: "Email",
                  lenght: 50,
                  validate: onValidate,
                  save: (value) {
                    email = value!;
                  },
                  inputValue: email),
              TextFormField(
                initialValue: number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                maxLength: 14,
                decoration: InputDecoration(
                  prefix: const Text('+855: '),
                  label: const Text('Phone Number'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please input your phone number";
                  } else if (value.trim().length < 8) {
                    return "phone number should have 8-10 digit";
                  }
                  return null;
                },
                onSaved: (value) {
                  number = value!;
                },
              ),
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
                      onPressed: onConfirmAdd,
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
