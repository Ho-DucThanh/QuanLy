class Room {
  int id;
  String imgUrl;
  String name;
  String desc;

  Room({
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.desc
  });

  static List<Room> ListRoom() {
    return [
      Room(id: 1, imgUrl: 'assets/images/phong1.jpg', name: 'Phòng 1', desc: 'Phòng số 1'),
      Room(id: 2, imgUrl: 'assets/images/phong2.jpg', name: 'Phòng 2', desc: 'Phòng số 2'),
      Room(id: 3, imgUrl: 'assets/images/phong3.jpg', name: 'Phòng 3', desc: 'Phòng số 3'),
      Room(id: 4, imgUrl: 'assets/images/phong4.jpg', name: 'Phòng 4', desc: 'Phòng số 4'),
    ];
  }
}