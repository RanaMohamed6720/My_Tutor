import 'package:final_project/screens/Athentication%20screens/signup.dart';
import 'package:final_project/screens/App%20screens/choose_department.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print("Getting tutors");
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ChooseDepartment(
                    user: null,
                  );
                }));
              },
              child: const Text("get a tutor"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Signup();
                }));
              },
              child: Text(
                "Become a tutor",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
