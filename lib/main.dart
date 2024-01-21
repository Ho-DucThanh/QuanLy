import 'package:benhvien/Screens/Home/hospital.dart';
import 'package:flutter/material.dart';
import '/Screens/Room/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quản lý bệnh viện',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHospital(),
    );
  }
}
