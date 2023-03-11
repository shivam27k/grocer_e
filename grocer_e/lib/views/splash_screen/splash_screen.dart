// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/views/auth_screen/login_screen.dart';
import 'package:grocer_e/widgets_common/applogo_widget.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          appLogoWidget(),
          appName.text
              .size(35)
              .color(logoTextColor)
              .fontWeight(FontWeight.bold)
              .make(),
          appVersion.text
              .size(10)
              .color(descColor)
              .fontWeight(FontWeight.w400)
              .make(),
          const SizedBox(height: 450),
          const CircularProgressIndicator(
            color: logoTextColor,
          ),
          const SizedBox(height: 20),
          credits.text
              .size(10)
              .color(descColor)
              .fontWeight(FontWeight.w400)
              .make(),
        ],
      ),
      backgroundColor: blackColor,
      nextScreen: const LoginScreen(),
      splashIconSize: 750,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}
