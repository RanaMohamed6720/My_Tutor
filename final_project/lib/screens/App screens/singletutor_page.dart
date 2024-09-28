import 'package:final_project/firebase_usage/user_model.dart';
import 'package:final_project/shared/shared_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class SingletutorPage extends StatelessWidget {
  SingletutorPage({super.key, required this.tutor});
  UserModel tutor;
  // whatsapp link is on this format https://wa.me/<number>
  String whatsappUrlFormat = 'https://wa.me/2';

  @override
  Widget build(BuildContext context) {
    final Uri whatsapp = Uri.parse(whatsappUrlFormat + tutor.phone);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          launchUrl(whatsapp);
        },
        child: Icon(Icons.call),
      ),
      body: Container(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 45, left: 20, right: 20),
                height: MediaQuery.of(context).size.height / 4.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 105)),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 6.5),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(70),
                    child: (tutor.imageurl.isEmpty)
                        ? CircleAvatar(
                            radius: 70,
                            child: Text(
                              tutor.name[0],
                              style: TextStyle(fontSize: 70),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image(
                              image: NetworkImage(tutor.imageurl),
                              height: 140,
                              width: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tutor.name,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          // name
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name'),
                        Text(tutor.name),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // phone
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone No.'),
                        Text(tutor.phone),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              goback(context: context);
            },
            child: Text('Go back'),
          ),
        ],
      )),
    );
  }
}
