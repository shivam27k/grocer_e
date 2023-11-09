import 'package:get/get.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/controllers/add_address_controller.dart';
import 'package:grocer_e/controllers/address_controller.dart';
import 'package:grocer_e/views/user_profile_screen/saved_address_screen/add_delivery_address.dart';
// import 'package:grocer_e/views/user_profile_screen/saved_address_screen/delivery_address_card.dart';

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({super.key});

  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState extends State<SavedAddressScreen> {
  // bool isAddress = false;
  var controller = Get.put(CheckoutProvider());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: "Saved Address".text.make(),
        ),
        bottomNavigationBar: Container(
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
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: blueColor,
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return const AddDeliveryAddress();
                  },
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: SlideTransition(
                        position: Tween(
                                begin: const Offset(1.0, 0.0),
                                end: const Offset(0.0, 0.0))
                            .animate(animation),
                        child: child,
                      ),
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 200),
                ),
              );
            },
            child: const Text(
              "Add new address",
              style: TextStyle(color: whiteColor),
            ),
          ),
        ),
        body: ListView(
          children: const [
            ListTile(
              title: Text("Deliver To",
                  style: TextStyle(
                      color: blueColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              visualDensity: VisualDensity(horizontal: -4, vertical: 0),
              minLeadingWidth: 10,
              leading: Icon(Icons.place, size: 23, color: blueColor),
            ),
            Divider(),
            Column(
              children: [
                AddressList(),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}





// Column(
//                   children: [
//                     SizedBox(
//                       width: (context.screenWidth * 0.77),
//                       child: const Text(
//                         "Password",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: blueColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     3.heightBox,
//                     MyTextField(
//                       controller: passwordController,
//                       hintText: hintConfirmPassword,
//                       obscureText: true,
//                     ),
//                   ],
//                 ),