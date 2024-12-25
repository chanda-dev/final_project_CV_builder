import 'package:builder/model/PersonalDetail/address.dart';
import 'package:flutter/material.dart';

class BuildContactInfo extends StatelessWidget {
  const BuildContactInfo({super.key, required this.icon, required this.info});
  final IconData icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black, size: 16),
          const SizedBox(width: 5),
          Expanded(
            child: Wrap(
              children: [
                Text(
                  info,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
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

class BuildContactInfoSmaller extends StatelessWidget {
  const BuildContactInfoSmaller(
      {super.key, required this.icon, required this.info});
  final IconData icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black, size: 12),
          const SizedBox(width: 5),
          Expanded(
            child: Wrap(
              children: [
                Text(
                  info,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 8,
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

class BuildAddressInfo extends StatelessWidget {
  const BuildAddressInfo({super.key, required this.icon, required this.info});
  final IconData icon;
  final Address info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black, size: 16),
          const SizedBox(width: 5),
          Expanded(
            child: Wrap(
              children: [
                Text(
                  '${info.country} ${info.city} ${info.district} ${info.village} ${info.streetNumber} ${info.homeNumber}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
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

class BuildAddressInfoSmaller extends StatelessWidget {
  const BuildAddressInfoSmaller(
      {super.key, required this.icon, required this.info});
  final IconData icon;
  final Address info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black, size: 12),
          const SizedBox(width: 5),
          Expanded(
            child: Wrap(
              children: [
                Text(
                  '${info.country} ${info.city} ${info.district} ${info.village} ${info.streetNumber} ${info.homeNumber}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 8,
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
