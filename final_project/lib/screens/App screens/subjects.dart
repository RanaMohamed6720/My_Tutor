import 'package:final_project/firebase_usage/department_model.dart';

import 'package:final_project/screens/App%20screens/alltutors_page.dart';
import 'package:final_project/screens/widgets/subject_widget.dart';
import 'package:final_project/shared/shared_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Subjects extends StatelessWidget {
  Subjects({super.key, required this.department});
  DepartmentModel department;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a subject'),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                goto(context: context, screen: AllTutorsPage(subject:department.subjects[index]));
              },
              child: SubjectWidget(subject: department.subjects[index]));
        },
        itemCount: department.subjects.length,
      ),
    );
  }
}
