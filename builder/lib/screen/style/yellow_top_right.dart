import 'dart:io';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/widget/for_style.dart';
import 'package:flutter/material.dart';

class YellowTopRight extends StatelessWidget {
  const YellowTopRight({super.key, required this.thirdDetail});
  final ThirdDetail thirdDetail;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              height: screenHeight,
              width: screenWidth * 0.55,
              child: _leftSide(thirdDetail, screenHeight),
            ),
            Container(
              height: screenHeight,
              color: Colors.amber,
              width: 2,
            ),
            SizedBox(
              height: screenHeight,
              width: screenWidth * 0.44,
              child: _rightSide(thirdDetail, screenHeight),
            ),
          ],
        ),
      ),
    );
  }

  Widget _leftSide(ThirdDetail thirdDetail, double screenHeight) {
    final personalDetail = thirdDetail.secondDetail.personalDetail;
    final secondDetail = thirdDetail.secondDetail;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Personal Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Text(
                      '${personalDetail.firstName.toUpperCase()} ${personalDetail.lastName.toUpperCase()}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      personalDetail.jobPosition.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),

              //const Spacer(), // Ensures alignment
              const Divider(color: Colors.amber, thickness: 2),
              const Text(
                'ABOUT ME',
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
              SizedBox(
                height: 110,
                child: Text(
                  personalDetail.description,
                  style: const TextStyle(color: Colors.grey, fontSize: 8),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.amber,
            thickness: 2,
          ),

          // Experience Section
          const Text(
            'EXPERIENCE',
            style: TextStyle(color: Colors.black, fontSize: 10),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: secondDetail.experience?.length ?? 0,
              itemBuilder: (context, index) {
                final experience = secondDetail.experience![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${experience.expRole} / ${experience.companyName}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 9),
                      ),
                      Text(
                        '${experience.startDate.year} - ${experience.endDate.year}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 8),
                      ),
                      Text(
                        experience.description,
                        style: const TextStyle(color: Colors.grey, fontSize: 8),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _rightSide(ThirdDetail thirdDetail, double screenHeight) {
    final personalDetail = thirdDetail.secondDetail.personalDetail;
    final secondDetail = thirdDetail.secondDetail;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Image
        Container(
          height: screenHeight * 0.3,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.amber),
          child: Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: personalDetail.profile.isEmpty
                  ? const AssetImage('assets/forgotProfle.png') as ImageProvider
                  : FileImage(File(personalDetail.profile)),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Courses Section
        const Text(
          'COURSES',
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
        const SizedBox(height: 8),
        Container(
          height: screenHeight * 0.15, // Reduce height for "Courses"
          child: ListView(
            children: secondDetail.education.map((item) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.college,
                    style: const TextStyle(color: Colors.black, fontSize: 9),
                  ),
                  Text(
                    '${item.startDateTime.year} - ${item.endDateTime.year}',
                    style: const TextStyle(color: Colors.black, fontSize: 8),
                  ),
                  Text(
                    '${item.degree} in ${item.major}',
                    style: const TextStyle(color: Colors.grey, fontSize: 8),
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }).toList(),
          ),
        ),

        // Contact Section
        const Text(
          'CONTACT',
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
        const SizedBox(height: 8),
        BuildContactInfo(icon: Icons.phone, info: personalDetail.telephone),
        BuildContactInfo(icon: Icons.email, info: personalDetail.email),
        BuildAddressInfo(icon: Icons.home_work, info: personalDetail.address),

        // Skills Section
        const SizedBox(height: 16),
        const Text(
          'SKILLS',
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView(
            children: thirdDetail.skills.map((skill) {
              return Row(
                children: [
                  const Icon(Icons.circle, size: 5, color: Colors.black),
                  const SizedBox(width: 4),
                  Text(
                    skill.yourSkill,
                    style: const TextStyle(color: Colors.grey, fontSize: 8),
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
