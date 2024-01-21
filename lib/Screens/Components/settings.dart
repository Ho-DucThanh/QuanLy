import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/user_interface.dart';

class MySettings extends StatelessWidget {
  const MySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterFace>(
        builder: (context, ui, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('My setting'),
              // backgroundColor: ui.selectedColor,
            ),
            body: Column(
              children: [
                Text(
                  "Font Size: ${ui.fontSize.toInt()}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                    },
                    child: Text("Change Color")),
                Slider(
                  min: 1,
                  max: 100,
                  value: ui.fontSize,
                  onChanged: (newValue) {
                    ui.fontSize = newValue;
                  },
                ),
              ],
            ),
          );
        }
    );
  }
}