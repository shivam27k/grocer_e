import 'package:grocer_e/consts/consts.dart';

class MyTextField extends StatelessWidget {
  final dynamic controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      // height: MediaQuery.of(context).size.height * 0.068,
      height: 45,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: borderWhiteColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: blueColor,
            ),
          ),
          fillColor: borderWhiteColor,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: fontGrey, fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
    );
  }
}
