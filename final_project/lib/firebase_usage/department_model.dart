
import 'package:firebase_storage/firebase_storage.dart';


class DepartmentModel {
  String name;
  List<dynamic> subjects;
  String imgUrl;
  final refStorage = FirebaseStorage.instance.ref();

  DepartmentModel({this.name = '', this.subjects = const [], this.imgUrl = ''});


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subjects': subjects,
      'imgUrl': imgUrl,
    };
  }

  DepartmentModel fromMap(Map<String, dynamic>? myMap) {
    return DepartmentModel(
      name: myMap!['name'],
      subjects: myMap['subjects'],
      imgUrl: myMap['imgUrl'],
    );
  }
}
