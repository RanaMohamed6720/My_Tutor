import 'package:final_project/firebase_usage/department_model.dart';
import 'package:flutter/material.dart';

class DepartmentCard extends StatelessWidget {
  final DepartmentModel department;

  DepartmentCard({Key? key, required this.department}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Material(
        elevation: 7,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // department image
              ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Image.network(
                  department.imgUrl,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20),
              // department name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    department.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
