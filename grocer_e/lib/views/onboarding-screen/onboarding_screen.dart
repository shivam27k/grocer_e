// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/views/login_screen/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (_, i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(onboardingLady)
                  .box
                  .width(250)
                  .height(233)
                  .rounded
                  .make(),
              (context.screenHeight * 0.05).heightBox,
              Container(
                child: onboardHeading.text
                    .fontWeight(FontWeight.w500)
                    .size(21)
                    .make(),
              ),
              (context.screenHeight * 0.01).heightBox,
              SizedBox(
                width: 200,
                child: onboardText.text
                    .align(TextAlign.center)
                    .size(16)
                    .lineHeight(1.4)
                    .make(),
              ),
              (context.screenHeight * 0.15).heightBox,
              40.heightBox,
              Container(
                width: 250,
                height: 50,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 10),
                    color: blackColor,
                    spreadRadius: -9,
                  ),
                ]),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: blueColor,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    buttonText,
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              ),
              (context.screenHeight * 0.001).heightBox,
            ],
          );
        },
      ),
    );
  }
}
