import 'dart:ui';

class DataModel {
  String image;
  String text;
  int number;
  Color contColor;

  DataModel(
      {required this.image,
      required this.text,
      required this.number,
      required this.contColor});
}

List<DataModel> list1 = [
  DataModel(
      image: 'images/doctor.jpeg',
      text: 'Cough & Cold',
      number: 10,
      contColor: Color(0xffe89176)),
  //FFAB91FF
  DataModel(
      image: 'images/doctor.jpeg',
      text: 'Flu & Fever',
      number: 5,
      contColor: Color(0xffe06b81))
];
