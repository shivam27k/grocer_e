import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/views/auth_GrocerE/login_screen/login_screen.dart';
import 'package:grocer_e/components/bg_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (context.screenHeight * 0.15).heightBox,
              Image.asset(onboardingLady)
                  .box
                  .width(250)
                  .height(233)
                  .rounded
                  .make(),
              (context.screenHeight * 0.04).heightBox,
              SizedBox(
                child: onboardHeading.text
                    .fontWeight(FontWeight.w500)
                    .size(30)
                    .make(),
              ),
              (context.screenHeight * 0.01).heightBox,
              SizedBox(
                width: 330,
                child: onboardText.text
                    .align(TextAlign.center)
                    .size(22)
                    .lineHeight(1.5)
                    .make(),
              ),
              (context.screenHeight * 0.15).heightBox,
              // 30.heightBox,
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 10),
                      color: blackColor,
                      spreadRadius: -9,
                    ),
                  ],
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: blueColor,
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
          ),
        ),
      ),
    );
  }
}
