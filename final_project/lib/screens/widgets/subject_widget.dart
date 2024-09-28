import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubjectWidget extends StatelessWidget {
  SubjectWidget({super.key, required this.subject});
  String subject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        color: Colors.deepPurple,
        elevation: 5,
        child: Center(
            child: Text(
          subject,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
