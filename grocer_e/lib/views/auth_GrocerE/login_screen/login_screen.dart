// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:grocer_e/components/my_text_field.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/views/auth_GrocerE/create_user_screen/create_user_screen.dart';
import 'package:grocer_e/components/applogo_widget.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/views/navigation_GrocerE/navigation_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  void signUserIn() async {
    BuildContext? context = _key.currentContext;

    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(color: logoTextColor),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context!,
        MaterialPageRoute(
          builder: (context) => const NavScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context!);
      if (e.code == 'user-not-found') {
        wrongEmailPasswordMessage();
      } else if (e.code == 'wrong-password') {
        wrongEmailPasswordMessage();
      }
    }
  }

  void wrongEmailPasswordMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(checkBothTitle),
          content: const Text(checkBothContent),
          backgroundColor: appBgColor,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 10),
                      color: blackColor,
                      spreadRadius: -9,
                    ),
                  ],
                ),
                child: const Text(
                  alertButton,
                  style: TextStyle(color: whiteColor),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> forgotPassword() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: logoTextColor,
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.value.text.trim(),
      );
      Navigator.pop(context);
      resetEmailSent();
    } on FirebaseAuthException {
      Navigator.pop(context);
      userNotFound();
    }
  }

  void resetEmailSent() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(resetEmailSentText),
          content:
              Text("$resetEmailSentContent ${emailController.text.trim()}"),
          backgroundColor: appBgColor,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 10),
                      color: blackColor,
                      spreadRadius: -9,
                    ),
                  ],
                ),
                child: const Text(
                  alertButton,
                  style: TextStyle(color: whiteColor),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void userNotFound() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(userNotFoundText),
          content: const Text(userNotFoundContent),
          backgroundColor: appBgColor,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 10),
                      color: blackColor,
                      spreadRadius: -9,
                    ),
                  ],
                ),
                child: const Text(
                  alertButton,
                  style: TextStyle(color: whiteColor),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void enterEmailPop() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(forgotPasswordText),
          content: MyTextField(
              controller: emailController,
              hintText: hintEmail,
              obscureText: false),
          backgroundColor: appBgColor,
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () {
                  forgotPassword();
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      right: 40, left: 40, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 10),
                        color: blackColor,
                        spreadRadius: -9,
                      ),
                    ],
                  ),
                  child: const Text(
                    getPasswordResetLink,
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  googleSignIn() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(color: logoTextColor),
        );
      },
    );
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      UserCredential? user = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      print(user.user?.email);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavScreen(),
        ),
      );
    } on FirebaseAuthException {
      // nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        key: _key,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.40,
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
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                (context.screenHeight * 0.01).heightBox,
                MyTextField(
                  controller: emailController,
                  hintText: hintEmail,
                  obscureText: false,
                ),
                (context.screenHeight * 0.01).heightBox,
                MyTextField(
                  controller: passwordController,
                  hintText: hintConfirmPassword,
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
                          enterEmailPop();
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
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      signUserIn();
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
                    GestureDetector(
                      onTap: googleSignIn,
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: whiteColor),
                            borderRadius: BorderRadius.circular(50),
                            color: borderWhiteColor,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                googleLogo,
                                height: 25,
                              ),
                              10.widthBox,
                              const Text(
                                signInWithGoogle,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateUserScreen()),
                        );
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
      ),
    );
  }
}
