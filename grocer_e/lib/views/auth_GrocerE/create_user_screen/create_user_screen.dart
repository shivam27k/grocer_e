// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocer_e/components/my_text_field.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/views/auth_GrocerE/login_screen/login_screen.dart';
import 'package:grocer_e/components/applogo_widget.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:email_otp/email_otp.dart';
import 'package:grocer_e/views/navigation_GrocerE/navigation_screen.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();

  checkIfEmailInUse(String emailAddress) async {
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
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);

      if (list.isNotEmpty) {
        if (FirebaseAuth.instance.currentUser?.providerData[2].providerId ==
            'google.com') {
          Navigator.pop(context);
          sendOTP();
        } else {
          Navigator.pop(context);
          accountAlreadyExists();
        }
      } else {
        Navigator.pop(context);
        sendOTP();
      }
    } catch (error) {
      Navigator.pop(context);
      // accountAlreadyExists();
    }
  }

  User? currentUser = FirebaseAuth.instance.currentUser;

  storeUserData(password, email) {
    FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).set({
      'name': "",
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid,
    });
  }

  void signUserUp() async {
    try {
      if (passwordController.text.trim() ==
          confirmPasswordController.text.trim()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        storeUserData(
          passwordController.text.trim(),
          emailController.text.trim(),
        );
      }
    } on FirebaseAuthException {
      // Navigator.pop(context);
    }
  }

  void accountAlreadyExists() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(accountAlreadyExistsText),
          content: const Text(accountAlreadyExistsContent),
          backgroundColor: appBgColor,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
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
                  accountCreatedButton,
                  style: TextStyle(color: whiteColor),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void passwordNotMatch() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(passwordNotMatchText),
          content: const Text(passwordNotMatchContent),
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

  EmailOTP myAuth = EmailOTP();

  Future<void> sendOTP() async {
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
    myAuth.setConfig(
        appEmail: "sinha.shruti0915@gmail.com",
        appName: "GrocerE",
        userEmail: emailController.value.text.trim(),
        otpLength: 5,
        otpType: OTPType.digitsOnly);

    var res = await myAuth.sendOTP();
    if (res) {
      Navigator.pop(context);
      verifyEmail();
    }
  }

  Future<void> validateOTP() async {
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
    var inputOTP = otpController.value.text.trim();
    var res = await myAuth.verifyOTP(otp: inputOTP);
    if (res) {
      Navigator.pop(context);
      accountCreated();
      signUserUp();
    } else {
      Navigator.pop(context);
      incorrectOTP();
    }
  }

  void incorrectOTP() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(incorrectOTPText),
          content: const Text(incorrectOTPContent),
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

  void verifyEmail() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(verifyEmailText),
          content: MyTextField(
              controller: otpController,
              hintText: "$hintVerifyEmail ${emailController.text.trim()}",
              obscureText: false),
          backgroundColor: appBgColor,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                validateOTP();
              },
              child: Container(
                padding: const EdgeInsets.only(
                    right: 40, left: 40, top: 10, bottom: 10),
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
                  verifyButtonText,
                  style: TextStyle(color: whiteColor),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void accountCreated() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(accountCreatedText),
          content: const Text(accountCreatedContent),
          backgroundColor: appBgColor,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
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
                  accountCreatedButton,
                  style: TextStyle(color: whiteColor),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void emptyField() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(emptyFieldText),
          content: const Text(emptyFieldContent),
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
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pop(context);
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
                        createYourAccount,
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
                  hintText: hintCreatePassword,
                  obscureText: true,
                ),
                (context.screenHeight * 0.01).heightBox,
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: hintConfirmPassword,
                  obscureText: true,
                ),
                (context.screenHeight * 0.075).heightBox,
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
                      if (passwordController.text.trim() == emptyText ||
                          confirmPasswordController.text.trim() == emptyText ||
                          emailController.text.trim() == emptyText) {
                        emptyField();
                      } else if (passwordController.text.trim() ==
                          confirmPasswordController.text.trim()) {
                        checkIfEmailInUse(emailController.text.trim());
                      } else {
                        passwordNotMatch();
                      }
                    },
                    child: const Text(
                      createAccountButton,
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                ),
                (context.screenHeight * 0.04).heightBox,
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
                      alreadyUser,
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
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        loginAccount,
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
