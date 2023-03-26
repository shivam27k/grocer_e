import 'package:grocer_e/components/my_text_field.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/views/create_user_screen/create_user_screen.dart';
import 'package:grocer_e/widgets_common/applogo_widget.dart';
import 'package:grocer_e/widgets_common/bg_widget.dart';
import '../home_screen/home_screen.dart';

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
          builder: (context) => const HomeScreen(),
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

  void forgotPassword() {}

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
                        onPressed: () {},
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
