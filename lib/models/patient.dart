class Patient {
  late int id_bn;
  late String imgPatient;
  late String name;
  late String work;
  late String can_cuoc;
  late String sdt;
  late String email;
  late String add;
  late DateTime ngaysinh;
  late String ten_benh;

  Patient({
    required this.id_bn,
    required this.imgPatient,
    required this.name,
    required this.work,
    required this.can_cuoc,
    required this.sdt,
    required this.add,
    required this.email,
    required this.ngaysinh,
    required this.ten_benh,
  });

  Patient.partial({
    required this.id_bn,
    required this.imgPatient,
    required this.name,
    required this.add,
    required this.ngaysinh,
    required this.ten_benh,
  });

  static List<Patient> ListPatient() {
    return [
      Patient(
        id_bn: 1,
        imgPatient: 'assets/images/bn1.png',
        name: 'Hồ Đức Thanh',
        work: 'Lập trình viên',
        can_cuoc: 'A453-HK14-7542',
        sdt: '0395694928',
        add: 'Quỳnh Lưu, Nghệ An',
        email: 'ducthanh@gmail.com',
        ngaysinh: DateTime(2003, 6, 29),
        ten_benh: 'Benh so 1',
      ),

      Patient(
        id_bn: 2,
        imgPatient: 'assets/images/bn2.png',
        name: 'Bùi Anh Việt',
        work: 'Bán cá',
        can_cuoc: 'A453-HK14-7542',
        sdt: '0395694928',
        add: 'Quất Lâm, Nam Định',
        email: 'buiviet@gmail.com',
        ngaysinh: DateTime(2002, 1, 5),
        ten_benh: 'Benh so 2',
      ),

      Patient(
        id_bn: 3,
        imgPatient: 'assets/images/bn3.png',
        name: 'Chu Tuấn Kiệt',
        work: 'Bán rau',
        can_cuoc: 'A453-HK14-7542',
        sdt: '0395694928',
        add: 'Mỹ Hào, Hưng Yên',
        email: 'tuankiet@gmail.com',
        ngaysinh: DateTime(2004, 7, 3),
        ten_benh: 'Benh so 3',
      ),

      Patient(
        id_bn: 4,
        imgPatient: 'assets/images/bn3.png',
        name: 'Lê Quốc Thái',
        work: 'Chăn ngựa',
        can_cuoc: 'A453-HK14-7542',
        sdt: '0395694928',
        add: 'Yên Nghĩa, Hà Nội',
        email: 'quocthai@gmail.com',
        ngaysinh: DateTime(2005, 5, 12),
        ten_benh: 'Benh so 4',
      ),
    ];
  }
}
