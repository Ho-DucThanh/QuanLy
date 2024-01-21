import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constanst/color.dart';
import '../../models/patient.dart';


class Profile extends StatefulWidget {
  final Patient selectedPatient;
  const Profile({super.key, required this.selectedPatient});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
              "Bệnh Nhân",
              style: TextStyle(color: Colors.white)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings), color: Colors.white)
        ],
        backgroundColor: k1Color,
      ),

      body: Column(
        children:  [
              Container(
                  width: double.infinity,
                  height: 150,
                  decoration: const BoxDecoration(
                      color: k1Color,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 50.0,
                        minRadius: 50.0,
                        backgroundImage: AssetImage(widget.selectedPatient.imgPatient.toString()),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                        widget.selectedPatient.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '${widget.selectedPatient.work} | No: ${widget.selectedPatient.id_bn}',
                            style: TextStyle(
                              color: k2Color,
                              fontSize: 14,
                            ),
                          )
                        ],
                      )
                    ],
                  )
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Căn cước công dân',
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              Text(
                                widget.selectedPatient.can_cuoc,
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Divider(
                                  thickness: 1.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.lock_outline, size: 20),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Số điện thoại',
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              Text(
                                widget.selectedPatient.sdt,
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Divider(
                                  thickness: 1.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.lock_outline, size: 20),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              Text(
                              widget.selectedPatient.email,
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Divider(
                                  thickness: 1.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.lock_outline, size: 20),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ngày Sinh',
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              Text(
                                DateFormat('dd-MM-yyyy').format(widget.selectedPatient.ngaysinh),
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Divider(
                                  thickness: 1.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.lock_outline, size: 20),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Địa chỉ',
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              Text(
                              widget.selectedPatient.add,
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Divider(
                                  thickness: 1.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.lock_outline, size: 20),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Loại bệnh',
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              Text(
                                widget.selectedPatient.ten_benh,
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Divider(
                                  thickness: 1.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.lock_outline, size: 20),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
      bottomNavigationBar: BottomNavigatorBarProFile(),
    );
  }
}

class BottomNavigatorBarProFile extends StatefulWidget {
  const BottomNavigatorBarProFile({super.key});

  @override
  State<BottomNavigatorBarProFile> createState() => _BottomNavigatorBarProFileState();
}

class _BottomNavigatorBarProFileState extends State<BottomNavigatorBarProFile> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: k1Color,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          label: 'Email',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      onTap: _onItemTapped,
    );
  }
}
