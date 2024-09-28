
import 'package:final_project/firebase_usage/firestore_functions.dart';
import 'package:final_project/firebase_usage/user_model.dart';
import 'package:final_project/screens/Athentication%20screens/choose_subject_signup.dart';
import 'package:final_project/screens/App%20screens/subjects.dart';
import 'package:final_project/screens/widgets/department_card.dart';
import 'package:final_project/shared/shared_methods.dart';
import 'package:flutter/material.dart';

class ChooseDepartment extends StatelessWidget {
  ChooseDepartment({super.key,this.user});
  UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose a department',
        ),
      ),
      body: FutureBuilder(
          future: FirestoreFunctions().getDepartments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error"));
            } else {
              if (snapshot.data == null) {
                return Center(
                  child: Text('No data to be shown.'),
                );
              } else {
                var mydepartments = snapshot.data;
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            goto(
                                context: context,
                                screen: (user != null)
                                    ? ChooseSubjectSignup(user: user!,department: mydepartments[index],)
                                    : Subjects(
                                        department: mydepartments[index]));
                          },
                          child:
                              DepartmentCard(department: mydepartments[index]));
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: mydepartments!.length);
              }
            }
          }),
    );
  }
}
