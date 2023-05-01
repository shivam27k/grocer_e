import 'package:grocer_e/components/applogo_widget.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: bgWidget(
        child: Scaffold(
          appBar: AppBar(
            title: "Terms and conditions".text.make(),
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
                    "Welcome to GrocerE! These terms and conditions govern your use of our mobile application, and services provided by GrocerE.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "By using our App or Services, you agree to be bound by these Terms. If you do not agree to these Terms, please do not use our App or Services.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "1. Account Registration: You may need to register for an account to use certain features of the App and Services. You agree to provide accurate and complete information when creating your account and to update your information as necessary to keep it accurate. You are responsible for maintaining the confidentiality of your login credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account or any other breach of security.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "2. Eligibility: You must be 18 years or older to use our Services. By using our Services, you represent and warrant that you meet all eligibility requirements.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "3. Use of Services: You may use our Services only for lawful purposes and in accordance with these Terms. You may not use our Services in any way that could damage, disable, overburden, or impair our servers or networks, or interfere with any other user's use and enjoyment of our Services.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "4. Ordering and Payment: You may use our Services to place orders for grocery products, and payment for these products will be processed through the App. By placing an order, you represent that you are authorized to use the payment method provided. You agree to pay all charges incurred by you or any users of your account and credit card (or other applicable payment mechanism) at the prices in effect when such charges are incurred.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "5. Delivery: We will make every effort to deliver your order on time, but delivery times may vary depending on various factors. We reserve the right to cancel any order for any reason, including if we are unable to fulfill your order for any reason. You will receive a full refund for any canceled orders.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "6. User Content: You may submit content to the App, including reviews and ratings of grocery products. You retain all ownership rights in any content you submit, but you grant us a non-exclusive, royalty-free, transferable, sublicensable, worldwide license to use, store, display, reproduce, modify, create derivative works, perform, and distribute your content in connection with the App and our Services.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "7. Intellectual Property: The App, Site, and Services and their entire contents, features, and functionality (including but not limited to all information, software, text, displays, images, video, and audio) are owned by us or our licensors and are protected by copyright, trademark, patent, trade secret, and other intellectual property laws.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "8. Disclaimers and Limitation of Liability: Our Services are provided and without warranties of any kind, either express or implied. We do not guarantee the accuracy, completeness, or timeliness of the information available through our Services. We will not be liable for any damages of any kind arising from the use of our Services.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "9. Account Registration: You may need to register for an account to use certain features of the App and Services. You agree to provide accurate and complete information when creating your account and to update your information as necessary to keep it accurate. You are responsible for maintaining the confidentiality of your login credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account or any other breach of security.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "10. Indemnification: You agree to indemnify and hold us and our affiliates, officers, directors, employees, and agents harmless from any claim or demand, including reasonable attorneys' fees, made by any third party due to or arising out of your breach of these Terms or your violation of any law or the rights of a third party.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.heightBox,
                  const Text(
                    "11. Contact Us: If you have any questions about these Terms or our Services, please contact us at support@grocere.com.",
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
