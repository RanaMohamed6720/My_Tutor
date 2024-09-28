import 'package:final_project/firebase_usage/firebase_auth.dart';
import 'package:final_project/firebase_usage/user_model.dart';
import 'package:final_project/screens/Athentication%20screens/login.dart';
import 'package:final_project/screens/Athentication%20screens/validation.dart';
import 'package:final_project/screens/App%20screens/choose_department.dart';
import 'package:final_project/screens/App%20screens/home_screen.dart';
import 'package:final_project/screens/widgets/snackbar.dart';
import 'package:final_project/shared/shared_methods.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // for toggling the password between visible and not visible
  bool isObscureText1 = true;
  bool isObscureText2 = true;
  // controllers for textformFields
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late String name, email, phone, password;
  signup() async {}
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
                        height: MediaQuery.of(context).size.height / 1.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Form(
                          /////form
                          key: formKey,
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
                                    'Sign Up',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: nameController,
                                validator: (value) {
                                  if (value.toString().isEmpty ||
                                      value == null) {
                                    return 'Please enter a valid name';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: const InputDecoration(
                                  hintText: 'Name',
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: phoneController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return Validation().validatePhoneNo(value);
                                },
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintText: 'Phone no.',
                                  prefixIcon: Icon(Icons.phone_android),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return Validation().validateEmail(value);
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: isObscureText1,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: passwordController,
                                validator: (value) {
                                  return Validation().validatePassword(value);
                                },
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isObscureText1 = !isObscureText1;
                                        });
                                      },
                                      icon:
                                          Icon(Icons.remove_red_eye_outlined)),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: isObscureText2,
                                controller: confirmedPasswordController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return Validation().validateConfirmedPassword(
                                      value, passwordController.text);
                                },
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isObscureText2 = !isObscureText2;
                                        });
                                      },
                                      icon:
                                          Icon(Icons.remove_red_eye_outlined)),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    name = nameController.text;
                                    phone = phoneController.text;
                                    email = emailController.text;
                                    password = passwordController.text;
                                  }
                                  UserModel user = UserModel(
                                      name: name,
                                      phone: phone,
                                      email: email,
                                      password: password,
                                      subject: '',
                                      department: '');
                                  String res = await FirebaseAuthService()
                                      .signup(user: user);
                                  if (res == 'success') {
                                    goto(
                                        context: context,
                                        screen: ChooseDepartment(
                                          user: user,
                                        ));
                                  } else {
                                    ShowSnakBar(context, res);
                                  }
                                },
                                child: const Text('SIGN UP'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        goto(context: context, screen: LoginPage());
                      },
                      child: const Text(
                        "Already have an account? Login",
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
