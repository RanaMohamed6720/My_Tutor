import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/firebase_usage/department_model.dart';
import 'package:final_project/firebase_usage/user_model.dart';

class FirestoreFunctions {
  var users = FirebaseFirestore.instance.collection('users');
  var departments = FirebaseFirestore.instance.collection('departments');

  void addUser({required UserModel user}) async {
    await users.doc(user.id).set(user.toMap(user: user));
  }

  Future<List<DepartmentModel>> getDepartments() async {
    var myDocs = await departments.get();
    var groupsDocs = myDocs.docs.map((e) => e.data());
    var theTrueData = groupsDocs.map((e) => DepartmentModel().fromMap(e));
    return theTrueData.toList();
  }

  Future<void> updateSubjects(String subject, UserModel user) async {
    try {
      await users.doc(user.id).update({'subject': subject});
      print('Subjects updated successfully');
    } catch (e) {
      print('Failed to update subjects: $e');
    }
  }

  Future<void> updateName(String name, UserModel user) async {
    try {
      await users.doc(user.id).update({'name': name});
      print('Name updated successfully');
    } catch (e) {
      print('Failed to update name: $e');
    }
  }

  Future<void> updatePhone(String phone, UserModel user) async {
    try {
      await users.doc(user.id).update({'phone': phone});
      print('Phone updated successfully');
    } catch (e) {
      print('Failed to update phone: $e');
    }
  }

  Future<void> updateImage(String imageUrl, UserModel user) async {
    try {
      await users.doc(user.id).update({'imageurl': imageUrl});
      print('Image updated successfully');
    } catch (e) {
      print('Failed to update image: $e');
    }
  }

  Future<List<UserModel>> getAvailableTutors({required String subject}) async {
    var myDocs = await users.where('subject', isEqualTo: subject).get();
    var myUsersDocs = myDocs.docs.map((e) => e.data());
    var theTrueData = myUsersDocs.map((e) => UserModel().fromMap(data: e));
    return theTrueData.toList();
  }

  Future<UserModel?> getUserById(String id) async {
    try {
      var userdoc = await users.doc(id).get();
      if (userdoc.exists) {
        return UserModel().fromMap(data: userdoc.data()!);
      } else {
        print('not found');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel?> getUserByEmail(String email) async {
    try {
      var query = await users.where('email', isEqualTo: email).get();
      if (query.docs.isNotEmpty) {
        var userData = query.docs.first.data();
        return UserModel().fromMap(data: userData);
      } else {
        print('not found');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
