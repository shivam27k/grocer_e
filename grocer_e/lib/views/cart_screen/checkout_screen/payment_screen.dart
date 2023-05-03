import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/components/loading_indicator.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/consts/firebase_consts.dart';
import 'package:grocer_e/controllers/cart_controller.dart';
// import 'package:grocer_e/views/home_screen/home_screen.dart';
import 'package:grocer_e/views/navigation_GrocerE/navigation_screen.dart';

class PaymentScreen extends StatefulWidget {
  final int addressOfUser;
  final int deliveryCharge;
  const PaymentScreen(
      {super.key, required this.addressOfUser, required this.deliveryCharge});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}
// var storedIndex = addressOfUser;

List paymentOption = ["PhonePe", "Google Pay", "Paytm", "Pay on delivery"];

class _PaymentScreenState extends State<PaymentScreen> {
  var paymentSelected = paymentOption[3];

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return bgWidget(
        child: SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('add_delivery_address')
                .where('address_of', isEqualTo: currentUser!.uid)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: loadingIndicator());
              } else {
                var data = snapshot.data!.docs;

                return Container(
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
                    onPressed: () async {
                      await controller.placeOrder(
                        "${data[widget.addressOfUser]['firstName']} ${data[widget.addressOfUser]['lastName']}",
                        "${data[widget.addressOfUser]['phNumber']}",
                        "${data[widget.addressOfUser]['addressLine1']}",
                        "${data[widget.addressOfUser]['addressLine2']}",
                        "${data[widget.addressOfUser]['area']}",
                        "${data[widget.addressOfUser]['pinCode']}",
                        paymentSelected,
                        "${controller.totalCartPrice.value + widget.deliveryCharge}",
                        "${widget.deliveryCharge}",
                      );

                      await controller.clearCart();
                      // ignore: use_build_context_synchronously
                      VxToast.show(context, msg: "Order Placed Successfully!");
                      Get.offAll(() => const NavScreen());
                    },
                    child: const Text(
                      "Place Order",
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                );
              }
            },
          ),
        ),
        appBar: AppBar(
          title: const Text("Make Payment"),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ListView(
            children: [
              const ListTile(
                title: Text(
                  "Select your payment method",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const Divider(color: darkFontGrey),
              RadioListTile(
                value: paymentOption[0],
                groupValue: paymentSelected,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("PhonePe",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Image.asset(phonePe).box.size(70, 50).make(),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    paymentSelected = paymentOption[0];
                    value = paymentSelected;
                  });
                },
              ),
              RadioListTile(
                value: paymentOption[1],
                groupValue: paymentSelected,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Google Pay",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Image.asset(googlePay).box.size(60, 60).make(),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    paymentSelected = paymentOption[1];
                    value = paymentSelected;
                  });
                },
              ),
              RadioListTile(
                value: paymentOption[2],
                groupValue: paymentSelected,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Paytm UPI",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Image.asset(paytmUpi).box.size(60, 60).make(),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    paymentSelected = paymentOption[2];
                    value = paymentSelected;
                  });
                },
              ),
              RadioListTile(
                value: paymentOption[3],
                groupValue: paymentSelected,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Pay on Delivery",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Image.asset(cod).box.size(60, 60).make(),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    paymentSelected = paymentOption[3];
                    value = paymentSelected;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
