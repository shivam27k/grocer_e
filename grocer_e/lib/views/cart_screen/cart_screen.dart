import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grocer_e/components/common_app_bar.dart';
import 'package:grocer_e/components/loading_indicator.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/firebase_consts.dart';
import 'package:grocer_e/controllers/cart_controller.dart';
import 'package:grocer_e/services/firestore_services.dart';
// import 'package:grocer_e/views/category_screen/categories/categories.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());

    return bgWidget(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const CommonAppBar(),
              20.heightBox,
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Text(
                  "Items in your cart",
                  style: TextStyle(
                    color: blueColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              13.heightBox,
              Container(
                height: MediaQuery.of(context).size.height,
                padding:
                    const EdgeInsets.only(bottom: 255, left: 20, right: 20),
                child: StreamBuilder(
                  stream: FireStoreServices.getCart(currentUser!.uid),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: loadingIndicator(),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: "Cart is Empty!".text.color(blueColor).make(),
                      );
                    } else {
                      var data = snapshot.data!.docs;
                      controller.calculateTotalCartPrice(data);

                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: Image.network(
                                        "${data[index]['image']}"),
                                    title: "${data[index]['title']}"
                                        .text
                                        .size(20)
                                        .fontWeight(FontWeight.w500)
                                        .color(blueColor)
                                        .make(),
                                    subtitle: Row(
                                      children: [
                                        const Icon(Icons.currency_rupee,
                                            size: 14, color: greenColor),
                                        "${data[index]['totalPrice']}"
                                            .text
                                            .size(16)
                                            .color(greenColor)
                                            .fontWeight(FontWeight.w500)
                                            .make(),
                                        5.widthBox,
                                        "- ${data[index]['quantity']} items"
                                            .text
                                            .size(16)
                                            .fontWeight(FontWeight.w500)
                                            .color(blueColor)
                                            .make(),
                                      ],
                                    ),
                                    trailing: const Icon(Icons.delete,
                                            color: redColor)
                                        .onTap(() {
                                      FireStoreServices.deleteDocument(
                                          data[index].id);
                                    }),
                                  )
                                      .box
                                      .color(lightGrey)
                                      .padding(const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15))
                                      .roundedSM
                                      .margin(const EdgeInsets.only(bottom: 10))
                                      .outerShadowXl
                                      .make();
                                }),
                          ),
                          5.heightBox,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                              color: lightGrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "Total Price:"
                                    .text
                                    .size(15)
                                    .fontWeight(FontWeight.bold)
                                    .color(blueColor)
                                    .make(),
                                Row(
                                  children: [
                                    const Icon(Icons.currency_rupee,
                                        size: 13, color: greenColor),
                                    Obx(
                                      () => "${controller.totalCartPrice.value}"
                                          .text
                                          .size(15)
                                          .color(greenColor)
                                          .fontWeight(FontWeight.bold)
                                          .make(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          5.heightBox,
                          Container(
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
                                "Checkout",
                                style: TextStyle(color: whiteColor),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
