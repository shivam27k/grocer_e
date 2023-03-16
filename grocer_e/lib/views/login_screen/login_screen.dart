// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/widgets_common/bg_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: const Scaffold(
        body: Center(
          child: Text(
            "Login page aagya hehe",
          ),
        ),
      ),
    );
  }
}
