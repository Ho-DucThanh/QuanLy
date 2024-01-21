import 'package:benhvien/Screens/Room/wigets.dart';
import 'package:flutter/material.dart';
import '../../constanst/color.dart';
import 'home.dart';

class EditRoomScreen extends StatefulWidget {
  final Room room;

  const EditRoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  _EditRoomScreenState createState() => _EditRoomScreenState();
}

class _EditRoomScreenState extends State<EditRoomScreen> {
  late TextEditingController imgUrlController;
  late TextEditingController nameController;
  late TextEditingController descriptionController;

  @override
  initState() {
    super.initState();
    imgUrlController = TextEditingController(text: widget.room.imgUrl);
    nameController = TextEditingController(text: widget.room.name);
    descriptionController = TextEditingController(text: widget.room.desc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chỉnh sửa phòng',
          style: TextStyle(color: Colors.white)),
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
              labelText: 'Mô tả',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  if (_validateInput()) {
                    widget.room.name = nameController.text;
                    widget.room.imgUrl = imgUrlController.text;
                    widget.room.desc = descriptionController.text;
                    Navigator.of(context).pop(widget.room);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cập nhật thành công')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Vui lòng nhập đủ thông tin')),
                    );
                  }
                },
                child: const Text('Lưu thay đổi'),
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
