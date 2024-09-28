import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_project/firebase_usage/user_model.dart';
import 'package:final_project/screens/App%20screens/profile.dart';
import 'package:final_project/screens/App%20screens/settings.dart';
import 'package:final_project/screens/App%20screens/tutor_homescreen.dart';
import 'package:flutter/material.dart';

class TutorNavpage extends StatefulWidget {
  TutorNavpage({super.key, required this.user});
  final UserModel user;

  @override
  State<TutorNavpage> createState() => _TutorNavpageState();
}

class _TutorNavpageState extends State<TutorNavpage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      TutorHomescreen(),
      ProfilePage(id: widget.user.id),
      SettingsPage()
    ];

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) => setState(() {
          currentPage = index;
        }),
        height: 65,
        animationDuration: const Duration(milliseconds: 500),
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(Icons.person, color: Colors.white),
          Icon(Icons.settings, color: Colors.white)
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: Colors.deepPurple,
      ),
      body: screens[currentPage],
    );
  }
}
