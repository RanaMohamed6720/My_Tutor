import 'package:final_project/firebase_usage/department_model.dart';
import 'package:final_project/firebase_usage/firestore_functions.dart';
import 'package:final_project/firebase_usage/user_model.dart';
import 'package:final_project/screens/App%20screens/tutor_navpage.dart';

import 'package:flutter/material.dart';

class ChooseSubjectSignup extends StatefulWidget {
  ChooseSubjectSignup(
      {super.key, required this.user, required this.department});

  UserModel user;
  DepartmentModel department;

  @override
  _ChooseSubjectSignupState createState() => _ChooseSubjectSignupState();
}

class _ChooseSubjectSignupState extends State<ChooseSubjectSignup> {
  String? selectedSubject;

  void _confirmSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Selection'),
        content: Text('Do you want to select ${selectedSubject}?'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedSubject = null;
              });
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              FirestoreFunctions()
                  .updateSubjects(selectedSubject!, widget.user);

              print(widget.user.subject);
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => TutorNavpage(user: widget.user)),
              );
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a subject to teach'),
      ),
      body: ListView.builder(
        itemCount: widget.department.subjects.length,
        itemBuilder: (context, index) {
          final subject = widget.department.subjects[index];
          return ListTile(
            title: Text(subject),
            trailing: Checkbox(
              value: selectedSubject == subject,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedSubject = subject;
                    _confirmSelection(context);
                  } else {
                    if (selectedSubject == subject) {
                      selectedSubject = null;
                    }
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
