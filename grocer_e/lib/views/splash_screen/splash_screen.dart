// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/views/onboarding-screen/onboarding_screen.dart';
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
      splash: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    appLogoWidget(),
                    appName.text
                        .size(35)
                        .fontWeight(FontWeight.bold)
                        .color(logoTextColor)
                        .make(),
                    appVersion.text
                        .color(descColor)
                        .size(10)
                        .fontWeight(FontWeight.w700)
                        .make(),
                  ],
                ),
              ),
              (context.screenHeight * 0.08).heightBox,
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CircularProgressIndicator(
                      color: logoTextColor,
                    ),
                    (context.screenHeight * 0.03).heightBox,
                    credits.text
                        .color(descColor)
                        .size(10)
                        .fontWeight(FontWeight.w700)
                        .make(),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      backgroundColor: splashBgColor,
      nextScreen: const OnboardingScreen(),
      splashIconSize: 900,
      duration: 3500,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}
