import 'package:final_project/screens/App%20screens/choose_department.dart';
import 'package:flutter/material.dart';

class TutorHomescreen extends StatelessWidget {
  const TutorHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ChooseDepartment();
                }));
              },
              child: const Text("get a tutor"),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
