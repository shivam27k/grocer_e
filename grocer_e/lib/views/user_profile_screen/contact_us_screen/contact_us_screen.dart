// ignore_for_file: avoid_unnecessary_containers

import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: bgWidget(
        child: Scaffold(
          appBar: AppBar(
            title: "Contact Us".text.make(),
          ),
          body: Container(child: const Text("Contact us screen")),
        ),
      ),
    );
  }
}
