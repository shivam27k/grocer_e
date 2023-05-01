// ignore_for_file: avoid_unnecessary_containers

import 'package:grocer_e/components/applogo_widget.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: bgWidget(
        child: Scaffold(
          appBar: AppBar(
            title: "About us".text.make(),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 45),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: appLogoWidget(),
                  ),
                  30.heightBox,
                  const Text(
                    "Welcome to GrocerE, your one-stop solution for all your grocery shopping needs! We are a team of dedicated professionals committed to providing you with the best shopping experience possible.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "Our mission is to make grocery shopping convenient, affordable, and hassle-free for everyone. With GrocerE, you can easily shop for your favorite groceries from the comfort of your own home, without ever having to leave your doorstep.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "At GrocerE, we understand the importance of quality and freshness when it comes to groceries. That's why we work with trusted suppliers and vendors who provide us with only the freshest and highest quality products. We also offer a wide range of products, including fresh fruits and vegetables, dairy and meat products, packaged foods, snacks, and beverages, as well as household essentials like cleaning products, personal care items, and more.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "We are committed to providing our customers with the best prices and deals on all our products, making it easy and affordable for everyone to shop with us. Our user-friendly app is designed to make your shopping experience as seamless and effortless as possible, with easy navigation, fast checkout, and timely delivery.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "At GrocerE, we believe that customer satisfaction is paramount. We strive to exceed your expectations by providing excellent customer service, fast and reliable delivery, and a hassle-free return policy.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "We are always looking for ways to improve our services and welcome your feedback and suggestions. So, whether you have a question, concern, or just want to say hello, feel free to reach out to us anytime.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "Thank you for choosing GrocerE for all your grocery shopping needs!",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
