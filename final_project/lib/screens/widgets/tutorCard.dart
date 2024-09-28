import 'package:final_project/firebase_usage/user_model.dart';
import 'package:final_project/screens/App%20screens/singletutor_page.dart';
import 'package:final_project/shared/shared_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Tutorcard extends StatelessWidget {
  Tutorcard({super.key, required this.tutor});

  UserModel tutor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          goto(context: context, screen: SingletutorPage(tutor: tutor));
        },
        child: Material(
          elevation: 7,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (tutor.imageurl.isNotEmpty)
                    ?
                    // department image
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          tutor.imageurl,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    : CircleAvatar(
                        radius: 50,
                        child: Text(
                          tutor.name[0],
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                SizedBox(width: 30),
                // department name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      tutor.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(tutor.phone),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
