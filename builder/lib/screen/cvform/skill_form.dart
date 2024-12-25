import 'package:builder/model/PersonalDetail/skill.dart';
import 'package:builder/screen/cvform/cv_form_second_page.dart';
import 'package:builder/widget/input_field.dart';
import 'package:builder/widget/text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SkillForm extends StatefulWidget {
  SkillForm({
    super.key,
    required this.mode,
    this.skill,
  });
  final Mode mode;
  final Skill? skill;

  @override
  State<SkillForm> createState() => _SkillFormState();
}

class _SkillFormState extends State<SkillForm> {
  final globalkey = GlobalKey<FormState>();
  String yourSkill = '';
  String rate = '0';
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
      final skillItem = Skill(yourSkill: yourSkill, rate: rate);
      Navigator.of(context).pop(skillItem);
    }
  }

  void initState() {
    super.initState();
    if (widget.mode == Mode.editing) {
      yourSkill = widget.skill!.yourSkill;
      rate = widget.skill!.rate;
    } else {
      yourSkill = '';
      rate = '';
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
              const Text('Skill'),
              TextFormInput(
                  label: "Your Skill",
                  lenght: 50,
                  validate: onValidate,
                  save: (value) {
                    yourSkill = value!;
                  },
                  inputValue: yourSkill),
              TextFormField(
                initialValue: rate,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                maxLength: 14,
                decoration: InputDecoration(
                  label: const Text('Rate'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please rate your self";
                  }
                  return null;
                },
                onSaved: (value) {
                  rate = value!;
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
