import 'package:final_project/firebase_usage/firebase_auth.dart';
import 'package:final_project/firebase_usage/firestore_functions.dart';
import 'package:final_project/firebase_usage/user_model.dart';
import 'package:final_project/screens/Athentication%20screens/signup.dart';
import 'package:final_project/screens/Athentication%20screens/validation.dart';
import 'package:final_project/screens/App%20screens/Tutor_navpage.dart';
import 'package:final_project/screens/App%20screens/home_screen.dart';
import 'package:final_project/screens/widgets/snackbar.dart';
import 'package:final_project/shared/shared_methods.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginKey = GlobalKey<FormState>();
  String email = "", password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                // mediaquery instead of a fixed value to look right in any screen regardless of its dimensions
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.deepPurple, Colors.purple])),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.7),
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: MediaQuery.of(context).size.height / 100,
                      child: Center(
                          child: Image.asset(
                        "assets/logos/logo.png",
                      )),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.of(context).size.height / 2.5,
                        height: MediaQuery.of(context).size.height / 2.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Form(
                          key: loginKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      goto(
                                          context: context,
                                          screen: HomeScreen());
                                    },
                                    icon: const Icon(Icons.arrow_back),
                                  ),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  const Text(
                                    'Login',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  return Validation().validateEmail(value);
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  return Validation().validatePassword(value);
                                },
                                obscureText: isObscureText,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isObscureText = !isObscureText;
                                          });
                                        },
                                        icon: const Icon(Icons.remove_red_eye)),
                                    prefixIcon: const Icon(Icons.lock)),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (loginKey.currentState!.validate()) {
                                    password = passwordController.text;
                                    email = emailController.text;
                                  }
                                  String res = await FirebaseAuthService()
                                      .loginUser(
                                          email: email, password: password);

                                  if (res == 'Success') {
                                    UserModel? user =  await FirestoreFunctions().getUserByEmail(email);
                                    goto(
                                        context: context,
                                        screen: TutorNavpage(user: user!));
                                  } else {
                                    ShowSnakBar(context, res);
                                  }
                                },
                                child: const Text('LOGIN'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    GestureDetector(
                      onTap: () {
                        goto(context: context, screen: Signup());
                      },
                      child: const Text(
                        "Don't have an account? Sign up",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
