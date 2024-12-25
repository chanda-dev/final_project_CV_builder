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
          SizedBox(
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
          height: 60, // Adjusted for smaller size
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${personalDetail.firstName.toUpperCase()} ${personalDetail.lastName.toUpperCase()}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 8, // Reduced font size
                    fontWeight: FontWeight.bold),
              ),
              Text(
                personalDetail.jobPosition.toUpperCase(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 7, // Reduced font size
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.amber, thickness: 1),
        const Text(
          'ABOUT ME',
          style: TextStyle(color: Colors.black, fontSize: 8), // Reduced size
        ),
        SizedBox(
          height: 50, // Adjusted for smaller size
          child: Text(
            personalDetail.description,
            style: const TextStyle(color: Colors.grey, fontSize: 6), // Smaller
          ),
        ),
        const Divider(color: Colors.amber),

        // Experience Section
        const Text(
          'EXPERIENCE',
          style: TextStyle(color: Colors.black, fontSize: 8), // Smaller
        ),
        const SizedBox(height: 4), // Reduced spacing
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
                    Text(
                      '${experience.startDate} - ${experience.endDate}',
                      style: const TextStyle(
                          color: Colors.black, fontSize: 6), // Smaller
                    ),
                    Text(
                      experience.description,
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 6), // Smaller
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
          height: 90, // Scaled down
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.amber),
          child: Center(
            child: CircleAvatar(
              radius: 30, // Reduced size
              backgroundImage: personalDetail.profile.isEmpty
                  ? const AssetImage('assets/forgotProfle.png') as ImageProvider
                  : FileImage(File(personalDetail.profile)),
            ),
          ),
        ),
        const SizedBox(height: 8), // Reduced spacing

        // Courses Section
        const Text(
          'COURSES',
          style: TextStyle(color: Colors.black, fontSize: 8), // Reduced size
        ),
        const SizedBox(height: 4), // Reduced spacing
        SizedBox(
          height: 50, // Reduced height
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
                    '${item.startDateTime} - ${item.endDateTime}',
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

        // Contact Section
        const Text(
          'CONTACT',
          style: TextStyle(color: Colors.black, fontSize: 8),
        ),
        const SizedBox(height: 4),
        BuildContactInfo(icon: Icons.phone, info: personalDetail.telephone),
        BuildContactInfo(icon: Icons.email, info: personalDetail.email),
        BuildAddressInfo(icon: Icons.home_work, info: personalDetail.address),

        // Skills Section
        const SizedBox(height: 8), // Reduced spacing
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
