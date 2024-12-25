import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/screen/mainpage/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ThirdDetailAdapter());
  await Hive.openBox<ThirdDetail>('details');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Mainscreen(),
  ));
}
