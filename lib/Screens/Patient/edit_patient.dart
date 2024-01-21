import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constanst/color.dart';
import '../../models/patient.dart';
import '../Room/wigets.dart';
// import 'home_patient.dart';

class EditPatientScreen extends StatefulWidget {
  final Patient patient;
  const EditPatientScreen({Key? key, required this.patient}) : super(key: key);

  @override
  State<EditPatientScreen> createState() => _EditPatientScreenState();
}

class _EditPatientScreenState extends State<EditPatientScreen> {

  late TextEditingController nameController = TextEditingController();
  late TextEditingController imgPatientController = TextEditingController();
  late TextEditingController addController = TextEditingController();
  late TextEditingController ngaysinhController = TextEditingController();
  late TextEditingController ten_benhController = TextEditingController();

  @override
  void initState() {
    super.initState();
    imgPatientController = TextEditingController(text: widget.patient.imgPatient);
    nameController = TextEditingController(text: widget.patient.name);
    addController = TextEditingController(text: widget.patient.add);
    ngaysinhController = TextEditingController(text: DateFormat('dd-MM-yyyy').format(widget.patient.ngaysinh));
    ten_benhController = TextEditingController(text: widget.patient.ten_benh);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Chỉnh Sửa thông tin bệnh nhân",
            style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
              controller: imgPatientController,
              labelText: 'URL hình ảnh',
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              controller: nameController,
              labelText: 'Tên bệnh nhân',
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              controller: addController,
              labelText: 'Địa chỉ',
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              controller: ngaysinhController,
              labelText: 'Ngày sinh',
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              controller: ten_benhController,
              labelText: 'Tên loại bệnh',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (_validateInput()) {
                    widget.patient.name = nameController.text;
                    widget.patient.imgPatient = imgPatientController.text;
                    widget.patient.add = addController.text;
                    widget.patient.ngaysinh = DateFormat('dd-MM-yyyy').parse(ngaysinhController.text);
                    widget.patient.ten_benh = ten_benhController.text;
                    Navigator.of(context).pop(widget.patient);
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
    return imgPatientController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        addController.text.isNotEmpty &&
        ngaysinhController.text.isNotEmpty &&
        ten_benhController.text.isNotEmpty;
  }
}
