import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constanst/color.dart';
import '../../models/patient.dart';
import '../Room/wigets.dart';


class AddPatientScreen extends StatelessWidget {
  List<Patient> patients;
  AddPatientScreen({super.key, required this.patients});

  final TextEditingController id_bnController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imgPatientController = TextEditingController();
  final TextEditingController addController = TextEditingController();
  final TextEditingController ngaysinhController = TextEditingController();
  final TextEditingController ten_benhController = TextEditingController();
  final TextEditingController workController = TextEditingController();
  final TextEditingController can_cuocController = TextEditingController();
  final TextEditingController sdtController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nhập thông tin bệnh nhân",
          style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop("/");
          },
        ),
        backgroundColor: kBottomColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                controller: workController,
                labelText: 'Nghề nghiệp',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                controller: can_cuocController,
                labelText: 'Căn cước công dân',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                controller: sdtController,
                labelText: 'Số điện thoại',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                controller: addController,
                labelText: 'Địa chỉ',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                controller: emailController,
                labelText: 'Email',
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
                      final newPatient = Patient(
                          id_bn: patients.length + 1,
                          imgPatient: imgPatientController.text,
                          name: nameController.text,
                          work: workController.text,
                          can_cuoc: can_cuocController.text,
                          sdt: sdtController.text,
                          add: addController.text,
                          email: emailController.text,
                          ngaysinh: DateFormat('dd-MM-yyyy').parse(ngaysinhController.text),
                          ten_benh: ten_benhController.text
                      );
                      Navigator.of(context).pop(newPatient);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Thêm bệnh nhân thành công')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Vui lòng nhập đủ thông tin')),
                      );
                    }
                  },
                  child: const Text('Thêm bệnh nhân'),
                ),
              ),
            ],
          ),
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
    ten_benhController.text.isNotEmpty &&
        workController.text.isNotEmpty &&
    can_cuocController.text.isNotEmpty &&
    sdtController.text.isNotEmpty &&
    emailController.text.isNotEmpty;
  }
}



