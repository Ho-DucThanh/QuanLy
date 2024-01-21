import '/Screens/Room/wigets.dart';
import 'package:flutter/material.dart';
import '../../constanst/color.dart';
import '../../models/room.dart';
import 'home.dart';

class AddRoomScreen extends StatelessWidget {
  List<Room> rooms;
  AddRoomScreen({
    Key? key,
    required this.rooms,
  }) : super(key: key);
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imgUrlController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
              "Nhập thông tin phòng",
               style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop("/");
          },
        ),
        backgroundColor: kBottomColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextField(
              controller: imgUrlController,
              labelText: 'URL hình ảnh',
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              controller: nameController,
              labelText: 'Tên phòng',
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              controller: descriptionController,
              labelText: 'Mô tả phòng',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (_validateInput()) {
                    final newRoom = Room(
                      id: rooms.length + 1,
                      imgUrl: imgUrlController.text,
                      name: nameController.text,
                      desc: descriptionController.text,
                    );
                    Navigator.of(context).pop(newRoom);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Thêm phòng thành công')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Vui lòng nhập đủ thông tin')),
                    );
                  }
                },
                child: const Text('Thêm phòng'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  bool _validateInput() {
    return imgUrlController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
  }
}
