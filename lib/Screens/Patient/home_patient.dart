import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constanst/color.dart';
import '../Room/wigets.dart';
import '../../models/patient.dart';
import '/Screens/Patient/profile.dart';
import 'add_patient.dart';
import 'edit_patient.dart';


class MyAppPatient extends StatelessWidget {
  const MyAppPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Danh sach benh nhan",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePatient(),
    );
  }
}

class MyHomePatient extends StatefulWidget {
  const MyHomePatient({super.key});

  @override
  State<MyHomePatient> createState() => _MyHomePatientState();
}

class _MyHomePatientState extends State<MyHomePatient> {
  List<Patient> patients = Patient.ListPatient();

   TextEditingController nameController = TextEditingController();
   TextEditingController imgPatientController = TextEditingController();
   TextEditingController addController = TextEditingController();
   TextEditingController ngaysinhController = TextEditingController();
   TextEditingController ten_benhController = TextEditingController();

  addPatient() async {
    final newPatient = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddPatientScreen(
              patients: patients,
          )),
    );
    if (newPatient != null) {
      setState(() {
        patients.add(newPatient);
      });
    }
  }

  editPatient(Patient patient) async {
    final updatePatient = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditPatientScreen(patient: patient)),
    );
    if (updatePatient != null) {
      setState(() {
        patient = updatePatient;
      });
    }
  }

  // Delete
  deletePatient(int id) {
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
                Text('Bạn có chắc chắn muốn xóa bệnh nhân này không?'),
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
                _deletePatient(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Function to delete room
  void _deletePatient(int id) {
    setState(() {
      patients.removeWhere((rm) => rm.id_bn == id);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Danh Sách Bệnh Nhân",
            style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(onPressed: (){ addPatient(); }, icon: Icon(Icons.add), color: Colors.white)
        ],
        backgroundColor: kBottomColor,
      ),

      body: Container(
        padding: const EdgeInsets.all(20),
        color: kBackground,
        child: SingleChildScrollView(
          child: Column(
            children: patients.map((pa) {
              return Column(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: <Widget> [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 130,
                          height: 130,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              pa.imgPatient.toString(),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${pa.id_bn} - ${pa.name}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(onPressed: () => editPatient(pa),
                                          icon: Icon(Icons.edit_outlined),
                                          iconSize: 20)
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        pa.add.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(onPressed: () => deletePatient(pa.id_bn),
                                          icon: Icon(Icons.delete_outline),
                                          iconSize: 20)
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat('dd-MM-yyyy').format(pa.ngaysinh),
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Profile(selectedPatient: pa)),
                                            );
                                          },
                                          icon: const Icon(
                                              Icons.arrow_forward_ios_outlined),
                                          iconSize: 20),
                                    ],
                                  ),

                                  Text(
                                    pa.ten_benh.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                        )
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
      //   onPressed: () => addPatient(),
      //   elevation: 4.0,
      //   icon: const Icon(Icons.add),
      //   label: const Text('Thêm'),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }
}





