import 'package:final_project/firebase_usage/firestore_functions.dart';
import 'package:final_project/firebase_usage/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  // for authentication
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> signup({required UserModel user}) async {
    String res = "Some error has occurred";
    try {
      // for registering the user in firebase auth
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      user.id = credential.user!.uid;
      // for adding user to cloud firebase
      FirestoreFunctions().addUser(user: user);

      res = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        res = ('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error has occurred";
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      res = "Success";
    } catch (e) {
      return 'Incorrect password';
    }
    return res;
  }
}
