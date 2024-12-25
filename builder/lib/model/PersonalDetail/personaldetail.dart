import 'package:builder/model/CV/cvitem.dart';
import 'package:builder/model/PersonalDetail/achivement.dart';
import 'package:builder/model/PersonalDetail/address.dart';
import 'package:builder/model/PersonalDetail/education.dart';
import 'package:builder/model/PersonalDetail/experience.dart';
import 'package:builder/model/PersonalDetail/hobbie.dart';
import 'package:builder/model/PersonalDetail/language.dart';
import 'package:builder/model/PersonalDetail/reference.dart';
import 'package:builder/model/PersonalDetail/skill.dart';
import 'package:hive/hive.dart';
//part 'third_detail.g.dart';

class Personaldetail {
  final CvStyle cvStyle;
  final String firstName;
  final String lastName;
  final Address address;
  final String telephone;
  final String email;
  final String jobPosition;
  final String description;
  final String profile;

  Personaldetail(
      {required this.cvStyle,
      required this.firstName,
      required this.lastName,
      required this.address,
      required this.telephone,
      required this.email,
      required this.jobPosition,
      required this.description,
      required this.profile});
}

class SecondDetail {
  final Personaldetail personalDetail;
  final List<Education> education;
  final List<Experience>? experience;

  SecondDetail(this.education, this.experience, {required this.personalDetail});
}

class ThirdDetail {
  @HiveField(0)
  final SecondDetail secondDetail;
  @HiveField(1)
  final List<Skill> skills;
  @HiveField(2)
  final List<Reference> references;

  ThirdDetail(
      {required this.secondDetail,
      required this.skills,
      required this.references});
  //final List<Language> language;
  //final List<Hobbie> hobbies;
  //final List<Achivement>? achivements;
  //final List<String> personalSkills;
}

List<ThirdDetail> detail = [];
