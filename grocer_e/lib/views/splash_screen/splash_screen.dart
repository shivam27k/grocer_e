// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:get/get.dart';
import 'package:grocer_e/views/auth_screen/login_screen.dart';
import 'package:grocer_e/widgets_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //creating a method to change screen

  changeScreen() {
    Future.delayed(const Duration(seconds: 300000), () {
      //using getX
      Get.to(() => const LoginScreen());
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: blackColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          appLogoWidget(),
          appName.text.fontFamily(bold).size(38).color(logoTextColor).make(),
          appVersion.text.fontFamily(regular).size(10).color(fontGrey).make(),
          const Spacer(),
          credits.text.fontFamily(regular).size(10).color(fontGrey).make(),
          20.heightBox,
        ]),
      ),
    );
  }
}
