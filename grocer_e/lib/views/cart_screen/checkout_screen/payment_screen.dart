import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/components/loading_indicator.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/consts/firebase_consts.dart';
import 'package:grocer_e/controllers/cart_controller.dart';
import 'package:grocer_e/services/firestore_services.dart';
import 'package:grocer_e/views/user_profile_screen/saved_address_screen/delivery_address_card.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var controller = Get.put(CartController());

  var random = 15 + Random().nextInt(15);

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
          width: context.screenWidth,
          height: 50,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                offset: Offset(0, 9),
                color: blackColor,
                spreadRadius: -10,
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
            onPressed: () {},
            child: const Text(
              "Make Payment",
              style: TextStyle(color: whiteColor),
            ),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder(
            stream: FireStoreServices.getCart(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else {
                var data = snapshot.data!.docs;

                return SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.heightBox,
                              const Text(
                                "Order summary",
                                style: TextStyle(
                                  color: darkFontGrey,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                                  .box
                                  .alignTopLeft
                                  .padding(const EdgeInsets.only(bottom: 5))
                                  .make(),
                              const Divider(color: blackColor),
                              20.heightBox,
                              const Text(
                                "Order Items",
                                style: TextStyle(
                                    color: blueColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              10.heightBox,
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxHeight: 100),
                                child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${data[index]['title']} x ${data[index]['quantity']}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: darkFontGrey,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.currency_rupee,
                                                size: 14, color: greenColor),
                                            "${data[index]['totalPrice']}"
                                                .text
                                                .size(16)
                                                .color(greenColor)
                                                .fontWeight(FontWeight.w500)
                                                .make(),
                                          ],
                                        ),
                                      ],
                                    )
                                        .box
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5))
                                        .make();
                                  },
                                ),
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Delivery Charge:",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: darkFontGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.currency_rupee,
                                          size: 14, color: greenColor),
                                      "$random"
                                          .text
                                          .size(16)
                                          .color(greenColor)
                                          .fontWeight(FontWeight.w500)
                                          .make(),
                                    ],
                                  ),
                                ],
                              )
                                  .box
                                  .margin(const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5))
                                  .make(),
                              const Divider(
                                color: darkFontGrey,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Sub total:",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: darkFontGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.currency_rupee,
                                          size: 13, color: greenColor),
                                      "${controller.totalCartPrice.value + random}"
                                          .text
                                          .size(15)
                                          .color(greenColor)
                                          .fontWeight(FontWeight.bold)
                                          .make(),
                                    ],
                                  ),
                                ],
                              )
                                  .box
                                  .margin(const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5))
                                  .make(),
                              20.heightBox,
                              const Text(
                                "Choose a Delivery Address",
                                style: TextStyle(
                                    color: blueColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              20.heightBox,
                              Expanded(
                                // child: AddressList(),
                                child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('add_delivery_address')
                                      .where('address_of',
                                          isEqualTo: currentUser!.uid)
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(child: loadingIndicator());
                                    } else if (snapshot.data!.docs.isEmpty) {
                                      return const Center(
                                        child: Text(
                                          "No Address Found!",
                                          style: TextStyle(
                                            color: darkFontGrey,
                                            decoration: TextDecoration.none,
                                            fontFamily: regular,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      );
                                    } else {
                                      var data = snapshot.data!.docs;
                                      return SizedBox(
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.5, // Set the height to whatever value you want
                                        child: ListView.builder(
                                          itemCount: data.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () => {
                                                setState(() {
                                                  if (selectIndex.contains(
                                                      index.toString())) {
                                                    selectIndex = 0;
                                                    // if (index == 1) {
                                                    //   selectIndex = 1;
                                                    // }
                                                  } else {
                                                    selectIndex = index;
                                                  }
                                                })
                                              },
                                              child: DeliveryAddressCard(
                                                title:
                                                    "${data[index]['firstName']} ${data[index]['lastName']}",
                                                address:
                                                    "${data[index]['addressLine1']}, ${data[index]['addressLine2']}, ${data[index]['area']}, ${data[index]['pinCode']}",
                                                addressType:
                                                    "${data[index]['addressType']}"
                                                        .trim(),
                                                phNumber:
                                                    "${data[index]['phNumber']}",
                                                docId: data[index].id,
                                                color: selectIndex == index
                                                    ? redColor
                                                    : lightGrey,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                              .box
                              .padding(
                                  const EdgeInsets.only(left: 15, right: 15))
                              .make(),
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 10, horizontal: 15),
                      //   margin: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                      //   decoration: BoxDecoration(
                      //     color: lightGrey,
                      //     borderRadius: BorderRadius.circular(5),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       "Total Price:"
                      //           .text
                      //           .size(15)
                      //           .fontWeight(FontWeight.bold)
                      //           .color(blueColor)
                      //           .make(),
                      // Row(
                      //   children: [
                      //     const Icon(Icons.currency_rupee,
                      //         size: 13, color: greenColor),
                      //     "${controller.totalCartPrice.value}"
                      //         .text
                      //         .size(15)
                      //         .color(greenColor)
                      //         .fontWeight(FontWeight.bold)
                      //         .make(),
                      //   ],
                      // ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
