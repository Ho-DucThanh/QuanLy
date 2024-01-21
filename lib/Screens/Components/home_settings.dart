import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/user_interface.dart';

class MyHomeSetting extends StatelessWidget {
  const MyHomeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterFace>(
        builder: (context, ui, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Title Appbar'),
              // backgroundColor: ui.selectedColor,
            ),
            body: Text(
              "Trang chủ",
              style: TextStyle(
                fontSize: ui.fontSize,
              ),
            ),
          );
        }
    );
  }
}