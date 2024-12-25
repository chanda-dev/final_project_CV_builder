import 'dart:io';

import 'package:builder/model/CV/cvitem.dart';
import 'package:builder/model/PersonalDetail/address.dart';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/screen/cvform/cv_form_second_page.dart';
import 'package:builder/widget/text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CvForm extends StatefulWidget {
  const CvForm({super.key, required this.cvStyle, this.mode, this.thirdDetail});
  final CvStyle cvStyle;
  final Mode? mode;
  final ThirdDetail? thirdDetail;
  //final Function(Personaldetail) onCreate;
  @override
  State<CvForm> createState() => _CvFormState();
}

class _CvFormState extends State<CvForm> {
  final _globalKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _phoneNumber = '';
  String _email = '';
  String _userCountry = '';
  String _userCity = '';
  String _userDistrict = '';
  String _userVillage = '';
  String _userStreetNumber = '';
  String _userHomeNumber = '';
  String _jobPosition = '';
  String _jobDescription = '';
  File? selectedImage;

  List<Address> address = [];
  void onNextForm() {
    bool isvalid = _globalKey.currentState!.validate();
    //experience.add(Experience(companyName: companyName, companyCity: companyCity, startDate: startDate, endDate: endDate, description: description, expRole: expRole))

    if (selectedImage == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Missing Profile'),
              content: Text('Please upload your Profile'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Back'))
              ],
            );
          });
      return;
    }
    if (isvalid) {
      _globalKey.currentState!.save();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CvFormSecondPage(
                    thirdDetail: widget.thirdDetail,
                    modes: widget.mode,
                    personalDetail: Personaldetail(
                      cvStyle: widget.cvStyle,
                      firstName: _firstName,
                      lastName: _lastName,
                      address: Address(
                          city: _userCity,
                          country: _userCountry,
                          district: _userDistrict,
                          village: _userVillage,
                          streetNumber: _userStreetNumber,
                          homeNumber: _userHomeNumber),
                      telephone: _phoneNumber,
                      email: _email,
                      jobPosition: _jobPosition,
                      description: _jobDescription,
                      profile: selectedImage?.path ?? "",
                    ),
                  )));
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.thirdDetail != null) {
      final Personaldetail personaldetail =
          widget.thirdDetail!.secondDetail.personalDetail;

      if (widget.mode == Mode.editing) {
        _firstName = personaldetail.firstName;
        _lastName = personaldetail.lastName;
        _phoneNumber = personaldetail.telephone;
        _email = personaldetail.email;
        _jobDescription = personaldetail.description;
        _jobPosition = personaldetail.jobPosition;
        _userCity = personaldetail.address.city;
        _userCountry = personaldetail.address.country;
        _userDistrict = personaldetail.address.district!;
        _userVillage = personaldetail.address.village!;
        _userHomeNumber = personaldetail.address.homeNumber!;
        _userStreetNumber = personaldetail.address.streetNumber!;
        selectedImage = File(personaldetail.profile);
      } else {
        _firstName = '';
        _lastName = '';
        _phoneNumber = '';
        _email = '';
        _jobDescription = '';
        _jobPosition = '';
        _userCity = '';
        _userCountry = '';
        _userDistrict = '';
        _userVillage = '';
        _userHomeNumber = '';
        _userStreetNumber = '';
      }
    }
  }

  String? onValidated(String? value, {String? text}) {
    if (value == null || value.isEmpty) {
      return 'Please input your $text';
    }
    if (text == "Description") {
      if (value.trim().length < 300) {
        return 'The desciption need at least 300 word';
      }
    }
    return null;
  }

  Future _pickImageFromGallery() async {
    final profile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (profile == null) return;
    setState(() {
      selectedImage = File(profile.path);
    });
  }

  // setHeight use it to set the height of education background when display it

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3EB489),
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey,
                  height: 200,
                  width: 150,
                  child: selectedImage != null
                      ? Image.file(selectedImage!)
                      : Center(child: const Text('Choose the Image')),
                ),
                ElevatedButton(
                    onPressed: () {
                      _pickImageFromGallery();
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text('Upload Image')),
                const Text(
                  'PROFILE',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                TextFormInput(
                    label: 'First Name',
                    lenght: 50,
                    validate: (value) => onValidated(value, text: 'First Name'),
                    save: (value) {
                      _firstName = value!;
                    },
                    inputValue: _firstName),
                TextFormInput(
                    label: 'Last Name',
                    lenght: 50,
                    validate: (value) => onValidated(value, text: 'Last Name'),
                    save: (value) {
                      _lastName = value!;
                    },
                    inputValue: _lastName),
                TextFormField(
                  initialValue: _phoneNumber,
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
                    _phoneNumber = value!;
                  },
                ),
                TextFormInput(
                    label: 'Email',
                    lenght: 50,
                    validate: (value) => onValidated(value, text: 'Email'),
                    save: (value) {
                      _email = value!;
                    },
                    inputValue: _email),
                const Text(
                  'ADDRESS',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                TextFormInput(
                    label: 'Country',
                    lenght: 50,
                    validate: (value) => onValidated(value, text: 'Country'),
                    save: (value) {
                      _userCountry = value!;
                    },
                    inputValue: _userCountry),
                TextFormInput(
                    label: 'City',
                    lenght: 50,
                    validate: (value) => onValidated(value, text: 'City'),
                    save: (value) {
                      _userCity = value!;
                    },
                    inputValue: _userCity),
                TextFormInput(
                    label: 'District',
                    lenght: 50,
                    validate: (value) => onValidated(value, text: 'District'),
                    save: (value) {
                      _userDistrict = value!;
                    },
                    inputValue: _userDistrict),
                TextFormInput(
                    label: 'Village',
                    lenght: 50,
                    validate: (value) => onValidated(value, text: 'Village'),
                    save: (value) {
                      _userVillage = value!;
                    },
                    inputValue: _userVillage),
                TextFormInput(
                    label: 'Street Number',
                    lenght: 50,
                    validate: (value) =>
                        onValidated(value, text: 'Street Number'),
                    save: (value) {
                      _userStreetNumber = value!;
                    },
                    inputValue: _userStreetNumber),
                TextFormInput(
                    label: 'Home Number',
                    lenght: 50,
                    validate: (value) =>
                        onValidated(value, text: 'Home number'),
                    save: (value) {
                      _userHomeNumber = value!;
                    },
                    inputValue: _userHomeNumber),
                const Text(
                  'APPLY POSITION',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                TextFormInput(
                    label: 'Position',
                    lenght: 50,
                    validate: (value) => onValidated(value, text: 'Position'),
                    save: (value) {
                      _jobPosition = value!;
                    },
                    inputValue: _jobPosition),
                const Text(
                  'ABOUT YOU',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                TextFormInput(
                    label: 'Description',
                    lenght: 600,
                    validate: (value) =>
                        onValidated(value, text: 'Description'),
                    save: (value) {
                      _jobDescription = value!;
                    },
                    inputValue: _jobDescription),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: onNextForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff246EE9),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Next Form',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
