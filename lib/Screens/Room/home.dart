import 'package:flutter/material.dart';
import '../../constanst/color.dart';
import '../../models/room.dart';
import '/Screens/Room/wigets.dart';
import '/Screens/Room/add_room.dart';
import '/Screens/Room/edit_room.dart';
import '/Screens/Patient/home_patient.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý bệnh viện',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Room> rooms = Room.ListRoom();

  TextEditingController imgUrlController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  addRoom() async {
    final newRoom = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddRoomScreen(
                rooms: rooms
          )),
    );
    if (newRoom != null) {
      setState(() {
        rooms.add(newRoom);
      });
    }
  }

  editRoom(Room room) async {
    final updatedRoom = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditRoomScreen(room: room)),
    );
    if (updatedRoom != null) {
      setState(() {
        room = updatedRoom;
      });
    }
  }

  deleteRoom(int id) {
    setState(() {
      _showDeleteConfirmationDialog(id);
    });
  }

  Future<void> _showDeleteConfirmationDialog(int id) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn có chắc chắn muốn xóa phòng này không?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Xóa'),
              onPressed: () {
                _deleteRoom(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Function to delete room
  void _deleteRoom(int id) {
    setState(() {
      rooms.removeWhere((rm) => rm.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const IconTitleWidget(),
        backgroundColor: kBottomColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(onPressed: (){
            addRoom();
          }, icon: Icon(Icons.add), color: Colors.white, iconSize: 25,)
        ],
      ),

      body: Container(
        padding: const EdgeInsets.all(20),
        color: kBackground,
        child: SingleChildScrollView(
          child: Column(
            children: rooms.map((rm) {
              return Column(
                children: [
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 130,
                          height: 130,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              rm.imgUrl.toString(),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                 left: 10, right: 0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${rm.id} - ${rm.name}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => MyHomePatient()),
                                          );
                                        },
                                        icon: const Icon(
                                            Icons.arrow_forward_ios_outlined),
                                            iconSize: 20),
                                  ],
                                ),
                                Text(
                                  rm.desc.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            editRoom(rm);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            side: BorderSide.none,
                                          ),
                                          child: const Icon(
                                            Icons.edit_rounded,
                                            size: 20,
                                          )),
                                      const SizedBox(width: 10),
                                      ElevatedButton(
                                          onPressed: () {
                                            deleteRoom(rm.id);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            side: BorderSide.none,
                                          ),
                                          child: const Icon(
                                            Icons.delete_outline,
                                            size: 20,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () => addRoom(),
      //   elevation: 4.0,
      //   icon: const Icon(Icons.add),
      //   label: const Text('Thêm phòng'),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }
}

