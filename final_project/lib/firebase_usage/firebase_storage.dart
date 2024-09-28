import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageFunctions {
  /// upload image
  Future<String?> uploadImage(File image) async {
    try {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref =
          FirebaseStorage.instance.ref().child('profile_images/$imageName');
      UploadTask uploadTask = ref.putFile(image);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      print('uploaded');
      return downloadUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
