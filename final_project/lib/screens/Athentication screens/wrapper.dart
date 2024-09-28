import 'package:final_project/firebase_usage/firestore_functions.dart';
import 'package:final_project/firebase_usage/user_model.dart';
import 'package:final_project/screens/App%20screens/Tutor_navpage.dart';
import 'package:final_project/screens/App%20screens/home_screen.dart';
import 'package:final_project/screens/Onboarding%20screens/onboarding_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool hasSeenOnboarding = false;
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    _checkIfOnboardingSeen();
  }

  // check if onboarding has been seen before
  Future<void> _checkIfOnboardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!hasSeenOnboarding) {
      return const OnBoardingPage();
    }

    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error"));
            } else if (snapshot.hasData) {
              // user is signed in
              User? firebaseUser = snapshot.data;

              if (firebaseUser != null) {
                return FutureBuilder(
                  future: FirestoreFunctions().getUserById((firebaseUser.uid)),
                  builder: (context, AsyncSnapshot<UserModel?> userSnapshot) {
                    if (userSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (userSnapshot.hasError || !userSnapshot.hasData) {
                      return Center(child: Text("Failed to load user data"));
                    } else {
                      userModel = userSnapshot.data!;
                      return TutorNavpage(user: userModel!);
                    }
                  },
                );
              } else {
                // no users created
                return HomeScreen();
              }
            } else {
              // user signed out
              return HomeScreen();
            }
          }),
    );
  }
}
