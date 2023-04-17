import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
import 'package:grocer_e/components/add_button_content.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/components/loading_indicator.dart';
import 'package:grocer_e/consts/consts.dart';
// import 'package:grocer_e/controllers/product_controller.dart';
import 'package:grocer_e/services/firestore_services.dart';

class Shops extends StatelessWidget {
  final String? title;
  final String? image;
  const Shops({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    // final availableProductsTitle = [
    //   "Aashirvaad Atta",
    //   "Potato",
    //   "Onions",
    //   "Dairy Milk",
    //   "Kit-Kat",
    //   "Loreal",
    //   "Schezwan Chutney",
    //   "Amul Milk",
    //   "Maggie",
    //   "Oreo",
    // ];
    // final availableProductsCategory = [
    //   "Baking",
    //   "Vegetables",
    //   "Vegetables",
    //   "Snacks",
    //   "Snacks",
    //   "Personal Care",
    //   "Vegetables",
    //   "Snacks",
    //   "Snacks",
    //   "Personal Care",
    // ];

    // final availableProductsImage = [
    //   aashirvaadAtta,
    //   potato,
    //   onions,
    //   dairyMilk,
    //   kitKat,
    //   lorealShampoo,
    //   schezwan,
    //   amulMilk,
    //   maggie,
    //   oreo,
    // ];

    // final availableProductsPrice = [
    //   "260",
    //   "20",
    //   "15",
    //   "50",
    //   "50",
    //   "110",
    //   "90",
    //   "29",
    //   "7",
    //   "30",
    // ];
    // final availableProductsQuantity = [
    //   "5 Kg",
    //   "1 Kg",
    //   "1 Kg",
    //   "1 Pc",
    //   "1 Pc",
    //   "1 Pc",
    //   "1 Pc",
    //   "1 Pc",
    //   "1 Pc",
    //   "1 Pc",
    // ];

    return bgWidget(
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: blueColor,
                      size: 40,
                    ).onTap(() {
                      Navigator.pop(context);
                    }),
                    (context.screenWidth * 0.40).widthBox,
                    Container(
                      height: 41,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "Select Address",
                        style: TextStyle(
                          fontFamily: regular,
                          color: whiteColor,
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                20.heightBox,
                Column(
                  children: [
                    SizedBox(
                      width: (context.screenWidth),
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: regular,
                          color: blueColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    15.heightBox,
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.network(
                        image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    15.heightBox,
                    Container(
                      width: (context.screenWidth),
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: lightGrey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "Available Products",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: regular,
                          color: blueColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    30.heightBox,
                    StreamBuilder(
                      stream: FireStoreServices.getProducts(title),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: loadingIndicator(),
                          );
                        } else if (snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text(
                              "No Products Found!",
                              style: TextStyle(
                                  color: darkFontGrey,
                                  decoration: TextDecoration.none,
                                  fontFamily: regular,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        } else {
                          var data = snapshot.data!.docs;

                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 15,
                              mainAxisExtent: 164,
                            ),
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          width: 1,
                                          color: lightGrey,
                                        ),
                                      ),
                                      // borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Image.network(
                                      data[index]['p_image'],
                                      height: 160,
                                      width: 160,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  10.widthBox,
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data[index]['p_name'],
                                          softWrap: false,
                                          maxLines: 2,
                                          overflow: TextOverflow.fade,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21,
                                            fontFamily: regular,
                                            color: blueColor,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        UnconstrainedBox(
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                              color: logoTextColor,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            height: 15,
                                            child: Text(
                                              data[index]['p_category'],
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: regular,
                                                color: blueColor,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        8.heightBox,
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.currency_rupee,
                                              color: greenColor,
                                              size: 15,
                                            ),
                                            Text(
                                              data[index]['p_price'],
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontFamily: regular,
                                                color: greenColor,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            20.widthBox,
                                            const Icon(
                                              Icons.shopping_bag,
                                              color: blueColor,
                                              size: 15,
                                            ),
                                            Text(
                                              data[index]['p_min_quantity'],
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: regular,
                                                color: blueColor,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ],
                                        ),
                                        5.heightBox,
                                        Container(
                                          alignment: Alignment.center,
                                          width: (context.screenWidth * 0.25),
                                          height: (context.screenHeight * 0.04),
                                          decoration: BoxDecoration(
                                            color: redColor,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 13,
                                                offset: Offset(0, 5),
                                                color: blackColor,
                                                spreadRadius: -10,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                isDismissible: false,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return WillPopScope(
                                                    onWillPop: () async =>
                                                        false,
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          20, 0, 20, 10),
                                                      height: 260,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          AddButtonContent(
                                                            productTitle:
                                                                data[index]
                                                                    ['p_name'],
                                                            productCategory: data[
                                                                    index]
                                                                ['p_category'],
                                                            productPrice:
                                                                data[index]
                                                                    ['p_price'],
                                                            productQuantity: data[
                                                                    index][
                                                                'p_min_quantity'],
                                                            productAvailable: data[
                                                                    index]
                                                                ['p_available'],
                                                            maxAvailable: data[
                                                                    index]
                                                                ['p_available'],
                                                            totalPrice:
                                                                data[index]
                                                                    ['p_price'],
                                                            productImage:
                                                                data[index]
                                                                    ['p_image'],
                                                            storeName:
                                                                data[index]
                                                                    ['p_store'],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              shadowColor: Colors.transparent,
                                            ),
                                            child: const Text(
                                              "Add",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: regular,
                                                color: whiteColor,
                                                decoration: TextDecoration.none,
                                              ),
                                            )
                                                .box
                                                .size(
                                                  (context.screenWidth * 0.25),
                                                  (context.screenWidth * 0.04),
                                                )
                                                .make(),
                                          ),
                                        )
                                      ],
                                    )
                                        .box
                                        .padding(const EdgeInsets.fromLTRB(
                                            10, 20, 10, 10))
                                        .make(),
                                  ),
                                ],
                              )
                                  .box
                                  .gray100
                                  .roundedSM
                                  .padding(const EdgeInsets.all(10))
                                  .make();
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
