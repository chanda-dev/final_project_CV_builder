import 'dart:io';

import 'package:builder/model/PersonalDetail/address.dart';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:flutter/material.dart';
import 'package:builder/widget/for_style.dart';

class RightStyle extends StatelessWidget {
  const RightStyle({
    super.key,
    required this.thirdDetail,
  });
  final ThirdDetail thirdDetail;

  @override
  Widget build(BuildContext context) {
    final personalDetail = thirdDetail.secondDetail.personalDetail;
    final address = personalDetail.address;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Section
            Container(
              width: screenWidth * 0.4,
              color: const Color(0xff333A4C),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: personalDetail.profile.isEmpty
                          ? const AssetImage('assets/forgotProfle.png')
                              as ImageProvider
                          : FileImage(File(personalDetail.profile)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Contact Details
                  const Text(
                    'Contact',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  BuildAddressInfo(icon: Icons.home_work, info: address),
                  BuildContactInfo(
                      icon: Icons.phone, info: personalDetail.telephone),
                  BuildContactInfo(
                      icon: Icons.email, info: personalDetail.email),
                  const SizedBox(height: 20),
                  // Education
                  const Text(
                    'Education',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  ...thirdDetail.secondDetail.education.map((item) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item.degree} degree in ${item.major}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          '${item.college} / ${item.collegeCountry}',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Text(
                          '${item.startDateTime.year} - ${item.endDateTime.year}',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  }),
                  const SizedBox(height: 20),
                  // Skills
                  const Text(
                    'Skills',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  ...thirdDetail.skills.map((skill) {
                    return Text(
                      skill.yourSkill,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    );
                  }),
                ],
              ),
            ),
            // Right Section
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Personal Details
                    Text(
                      '${personalDetail.firstName} ${personalDetail.lastName}',
                      style: const TextStyle(
                        color: Color(0xff333A4C),
                        fontSize: 25,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      personalDetail.jobPosition,
                      style: const TextStyle(
                        color: Color(0xff333A4C),
                        fontSize: 16,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      personalDetail.description,
                      style: const TextStyle(
                        color: Color(0xff333A4C),
                        fontSize: 12,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Work Experience
                    const Text(
                      'Work Experience',
                      style: TextStyle(
                        color: Color(0xff333A4C),
                        fontSize: 16,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const Divider(color: Color(0xff333A4C)),
                    ...thirdDetail.secondDetail.experience!.map((exp) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${exp.expRole} at ${exp.companyName}',
                              style: const TextStyle(
                                color: Color(0xff333A4C),
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '${exp.startDate.year} - ${exp.endDate.year}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              exp.description,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    // References
                    const Text(
                      'References',
                      style: TextStyle(
                        color: Color(0xff333A4C),
                        fontSize: 16,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const Divider(color: Color(0xff333A4C)),
                    ...thirdDetail.references.map((ref) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ref.name,
                              style: const TextStyle(
                                color: Color(0xff333A4C),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              ref.job,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              ref.number,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              ref.email,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
