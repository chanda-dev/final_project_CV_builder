import 'dart:io';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/widget/for_style.dart';
import 'package:flutter/material.dart';

class YellowTopRightSmaller extends StatelessWidget {
  const YellowTopRightSmaller({super.key, required this.thirdDetail});
  final ThirdDetail thirdDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(2, 10, 0, 0),
            height: 300,
            width: 200 * 0.55,
            child: _leftSide(thirdDetail),
          ),
          Container(
            height: 300,
            color: Colors.amber,
            width: 1,
            margin: EdgeInsets.only(top: 90),
          ),
          SizedBox(
            height: 300,
            width: 200 * 0.40,
            child: _rightSide(thirdDetail),
          ),
        ],
      ),
    );
  }

  Widget _leftSide(ThirdDetail thirdDetail) {
    final personalDetail = thirdDetail.secondDetail.personalDetail;
    final secondDetail = thirdDetail.secondDetail;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Personal Details
        SizedBox(
          height: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${personalDetail.firstName.toUpperCase()} ${personalDetail.lastName.toUpperCase()}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                personalDetail.jobPosition.toUpperCase(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 7,
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.amber, thickness: 1),
        const Text(
          'ABOUT ME',
          style: TextStyle(color: Colors.black, fontSize: 8),
        ),
        SizedBox(
          height: 50,
          child: Text(
            personalDetail.description,
            style: const TextStyle(color: Colors.grey, fontSize: 6),
          ),
        ),
        const Divider(color: Colors.amber),

        // Experience
        const Text(
          'EXPERIENCE',
          style: TextStyle(color: Colors.black, fontSize: 8),
        ),
        const SizedBox(height: 4),
        Expanded(
          child: ListView.builder(
            itemCount: secondDetail.experience?.length ?? 0,
            itemBuilder: (context, index) {
              final experience = secondDetail.experience![index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${experience.expRole} / ${experience.companyName}',
                      style: const TextStyle(
                          color: Colors.black, fontSize: 7), // Smaller
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _rightSide(ThirdDetail thirdDetail) {
    final personalDetail = thirdDetail.secondDetail.personalDetail;
    final secondDetail = thirdDetail.secondDetail;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Image
        Container(
          height: 90,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.amber),
          child: Center(
            child: CircleAvatar(
              radius: 30,
              backgroundImage: personalDetail.profile.isEmpty
                  ? const AssetImage('assets/forgotProfle.png') as ImageProvider
                  : FileImage(File(personalDetail.profile)),
            ),
          ),
        ),
        const SizedBox(height: 8),

        const Text(
          'COURSES',
          style: TextStyle(color: Colors.black, fontSize: 8),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 50,
          child: ListView(
            children: secondDetail.education.map((item) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.college,
                    style: const TextStyle(color: Colors.black, fontSize: 7),
                  ),
                  Text(
                    '${item.startDateTime.year} - ${item.endDateTime.year}',
                    style: const TextStyle(color: Colors.black, fontSize: 6),
                  ),
                  Text(
                    '${item.degree} in ${item.major}',
                    style: const TextStyle(color: Colors.grey, fontSize: 6),
                  ),
                  const SizedBox(height: 4),
                ],
              );
            }).toList(),
          ),
        ),

        // Contact
        const Text(
          'CONTACT',
          style: TextStyle(color: Colors.black, fontSize: 8),
        ),
        const SizedBox(height: 4),
        BuildContactInfoSmaller(
            icon: Icons.phone, info: personalDetail.telephone),
        BuildContactInfoSmaller(icon: Icons.email, info: personalDetail.email),
        BuildAddressInfoSmaller(
            icon: Icons.home_work, info: personalDetail.address),

        // Skills
        const SizedBox(height: 8),
        const Text(
          'SKILLS',
          style: TextStyle(color: Colors.black, fontSize: 8),
        ),
        const SizedBox(height: 4),
        Expanded(
          child: ListView(
            children: thirdDetail.skills.map((skill) {
              return Row(
                children: [
                  const Icon(Icons.circle, size: 4, color: Colors.black),
                  const SizedBox(width: 2),
                  Text(
                    skill.yourSkill,
                    style: const TextStyle(color: Colors.grey, fontSize: 6),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
