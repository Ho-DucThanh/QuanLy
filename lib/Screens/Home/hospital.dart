import '../Room/home.dart';
import '/constanst/color.dart';
import 'package:flutter/material.dart';

class MyHospital extends StatelessWidget {
  const MyHospital({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: k1Color,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/hospital1.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(height: 50,),
            Text(
              'Manage Hospital',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Quản lý bệnh viện',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
                child: Text(
                    "Let's Go",
                    style: TextStyle(
                    color: k1Color,
                    fontWeight: FontWeight.bold,
                    fontSize:25
                  ),
                )
            ),
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/doctor.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
