import 'dart:io';

import 'package:builder/model/PersonalDetail/address.dart';
import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:flutter/material.dart';

class CompactRightStyle extends StatelessWidget {
  const CompactRightStyle({
    super.key,
    required this.thirdDetail,
  });
  final ThirdDetail thirdDetail;

  @override
  Widget build(BuildContext context) {
    final personalDetail = thirdDetail.secondDetail.personalDetail;
    final address = personalDetail.address;

    return Container(
      width: 200,
      height: 300,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left
          Container(
            width: 60,
            color: const Color(0xff333A4C),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                Center(
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: personalDetail.profile.isEmpty
                        ? const AssetImage('assets/forgotProfle.png')
                            as ImageProvider
                        : FileImage(File(personalDetail.profile)),
                  ),
                ),
                const SizedBox(height: 6),
                _buildAddressInfo(Icons.home_work, address),
                _buildContactInfo(Icons.phone, personalDetail.telephone),
                _buildContactInfo(Icons.email, personalDetail.email),
                const SizedBox(height: 4),
                // Education
                const Text(
                  'Education',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 7),
                      ),
                      Text(
                        '${item.college} / ${item.collegeCountry}',
                        style: const TextStyle(color: Colors.grey, fontSize: 5),
                      ),
                      const SizedBox(height: 4),
                    ],
                  );
                }),
                const SizedBox(height: 4),
                // Skills
                const Text(
                  'Skills',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 7,
                    decoration: TextDecoration.none,
                  ),
                ),
                const Divider(color: Colors.grey, height: 4),
                ...thirdDetail.skills.take(2).map((skill) {
                  return Text(
                    skill.yourSkill,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                }),
              ],
            ),
          ),
          // Right
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Personal Details
                  Text(
                    '${personalDetail.firstName} ${personalDetail.lastName}',
                    style: const TextStyle(
                      color: Color(0xff333A4C),
                      fontSize: 10,
                      decoration: TextDecoration.none,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    personalDetail.jobPosition,
                    style: const TextStyle(
                      color: Color(0xff333A4C),
                      fontSize: 8,
                      decoration: TextDecoration.none,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Work Experience
                  const Text(
                    'Experience',
                    style: TextStyle(
                      color: Color(0xff333A4C),
                      fontSize: 8,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const Divider(color: Color(0xff333A4C), height: 4),
                  ...thirdDetail.secondDetail.experience!
                      .take(2)
                      .map((exp) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exp.expRole,
                                style: const TextStyle(
                                  color: Color(0xff333A4C),
                                  fontSize: 7,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                exp.companyName,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 7,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )),
                  const SizedBox(height: 4),
                  // References
                  const Text(
                    'Reference',
                    style: TextStyle(
                      color: Color(0xff333A4C),
                      fontSize: 8, // Smaller font
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const Divider(color: Color(0xff333A4C), height: 4),
                  if (thirdDetail.references.isNotEmpty)
                    Text(
                      thirdDetail.references.first.name,
                      style: const TextStyle(
                        color: Color(0xff333A4C),
                        fontSize: 7,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String info) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 8),
          const SizedBox(width: 2),
          Expanded(
            child: Text(
              info,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 7,
                decoration: TextDecoration.none,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressInfo(IconData icon, Address info) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 8),
          const SizedBox(width: 2),
          Expanded(
            child: Wrap(
              children: [
                Text(
                  '${info.country} ${info.city} ${info.district} ${info.village} ${info.streetNumber} ${info.homeNumber}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 7,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
