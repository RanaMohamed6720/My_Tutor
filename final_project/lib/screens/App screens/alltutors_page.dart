import 'package:final_project/firebase_usage/firestore_functions.dart';
import 'package:final_project/screens/widgets/tutorCard.dart';
import 'package:flutter/material.dart';

class AllTutorsPage extends StatelessWidget {
  AllTutorsPage({super.key, required this.subject});
  String subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: FirestoreFunctions().getAvailableTutors(subject: subject),
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
                var tutors = snapshot.data;
                return (tutors!.isEmpty)
                    ? Center(
                        child: Text(
                        'No tutors to show',
                        style: TextStyle(fontSize: 20),
                      ))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return Tutorcard(tutor: tutors[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: tutors.length);
              }
            }
          }),
    );
  }
}
