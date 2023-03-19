// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

import 'package:grocer_e/components/my_text_field.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/widgets_common/applogo_widget.dart';
import 'package:grocer_e/widgets_common/bg_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in
  void signUserIn() {}
  void forgotPassword() {}

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 1,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [blueColor, appBgColor],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appLogoWidget(),
                    12.heightBox,
                    const Text(
                      logInText,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: darkFontGrey,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              (context.screenHeight * 0.01).heightBox,
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              (context.screenHeight * 0.03).heightBox,
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              (context.screenHeight * 0.001).heightBox,
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0.0),
                      ),
                      onPressed: () {
                        forgotPassword;
                      },
                      child: const Text(
                        forgotPasswordText,
                        style: TextStyle(
                            color: fontGrey, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              (context.screenHeight * 0.06).heightBox,
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
                    padding: const EdgeInsets.all(18.0),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    signUserIn;
                  },
                  child: const Text(
                    logInButton,
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              ),
              (context.screenHeight * 0.05).heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: darkFontGrey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        continueOptionText,
                        style: TextStyle(
                          color: blueColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: darkFontGrey,
                      ),
                    ),
                  ],
                ),
              ),
              (context.screenHeight * 0.03).heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: whiteColor),
                      borderRadius: BorderRadius.circular(50),
                      color: borderWhiteColor,
                    ),
                    child: Image.asset(
                      googleLogo,
                      height: 35,
                    ),
                  ),
                  20.widthBox,
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: whiteColor),
                      borderRadius: BorderRadius.circular(50),
                      color: borderWhiteColor,
                    ),
                    child: Image.asset(
                      twitterLogo,
                      height: 35,
                    ),
                  ),
                  20.widthBox,
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: whiteColor),
                      borderRadius: BorderRadius.circular(50),
                      color: borderWhiteColor,
                    ),
                    child: Image.asset(
                      facebookLogo,
                      height: 35,
                    ),
                  ),
                ],
              ),
              (context.screenHeight * 0.03).heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    notAMember,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  5.widthBox,
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0.0),
                    ),
                    onPressed: () {
                      forgotPassword;
                    },
                    child: const Text(
                      createAccount,
                      style: TextStyle(
                        fontSize: 12,
                        color: blueColor,
                        fontWeight: FontWeight.w600,
                      ),
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
