import 'package:final_project/screens/App%20screens/home_screen.dart';
import 'package:final_project/screens/Onboarding%20screens/animated_dot.dart';
import 'package:final_project/screens/Onboarding%20screens/onboarding_demodata.dart';
import 'package:final_project/screens/widgets/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    //reset and hot restart then comment and hot restart again to see the onboarding screen
    //reset(context); //for debugging purposes
  }

  // reset (onboarding-is-seen flag is set to false)
  Future<void> reset(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', false);
  }

  // set onboarding is seen flag to true
  Future<void> _setOnboardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                height: 500,
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemCount: demoData.length,
                  itemBuilder: (context, index) {
                    return OnboardContent(
                      illustration: demoData[index]["illustration"],
                      title: demoData[index]["title"],
                      text: demoData[index]["text"],
                    );
                  },
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  demoData.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: AnimatedDot(isActive: selectedIndex == index),
                  ),
                ),
              ),
              const Spacer(flex: 2),
              ElevatedButton(
                onPressed: () async {
                  // set onboarding screen to seen and navigate to registering
                  await _setOnboardingSeen();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Text(
                  "GET STARTED",
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
