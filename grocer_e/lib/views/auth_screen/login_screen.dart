// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocer_e/consts/consts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGrey,
        body: Center(
          child: appName.text.color(greenColor).size(50).make(),
        ));
  }
}
