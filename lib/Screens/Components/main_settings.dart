import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/user_interface.dart';
import 'settings.dart';
import 'home_settings.dart';


class MyAppSetting extends StatelessWidget {
  const MyAppSetting({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserInterFace(),
      // child: MaterialApp(
      //   initialRoute: "/main_settings",
      //   routes: {
      //     "/home_settings": (context) => MyHomeSetting(),
      //     "/settings": (context) => MySettings(),
      //   },
      // ),

      child: Scaffold(
        body: MyHomeSetting(), // Set the initial page here
      ),
    );
  }
}