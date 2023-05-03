import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocer_e/components/add_button_content.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/components/loading_indicator.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/services/firestore_services.dart';

class SearchResultScreen extends StatelessWidget {
  final String? title;
  const SearchResultScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.make(),
        ),
        body: FutureBuilder(
          future: FireStoreServices.searchProducts(title),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return "No products found".text.size(300).makeCentered();
            } else {
              var data = snapshot.data!.docs;
              var filtered = data
                  .where((element) => element['p_name']
                      .toString()
                      .toLowerCase()
                      .contains(title!.toLowerCase()))
                  .toList();
              return Container(
                padding: const EdgeInsets.all(15),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 180,
                  ),
                  children: filtered
                      .mapIndexed(
                        (currentValue, index) => Row(
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
                                filtered[index]['p_image'],
                                height: 160,
                                width: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                            10.widthBox,
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        filtered[index]['p_store'],
                                        style: const TextStyle(
                                          color: redColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        filtered[index]['p_name'],
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
                                    ],
                                  ),
                                  UnconstrainedBox(
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: logoTextColor,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      height: 15,
                                      child: Text(
                                        filtered[index]['p_category'],
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
                                        filtered[index]['p_price'],
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
                                        filtered[index]['p_min_quantity'],
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
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          isDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return WillPopScope(
                                              onWillPop: () async => false,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 20, 10),
                                                height: 260,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    AddButtonContent(
                                                      productTitle:
                                                          filtered[index]
                                                              ['p_name'],
                                                      productCategory:
                                                          filtered[index]
                                                              ['p_category'],
                                                      productPrice:
                                                          filtered[index]
                                                              ['p_price'],
                                                      productQuantity: filtered[
                                                              index]
                                                          ['p_min_quantity'],
                                                      productAvailable:
                                                          filtered[index]
                                                              ['p_available'],
                                                      maxAvailable:
                                                          filtered[index]
                                                              ['p_available'],
                                                      totalPrice:
                                                          filtered[index]
                                                              ['p_price'],
                                                      productImage:
                                                          filtered[index]
                                                              ['p_image'],
                                                      storeName: filtered[index]
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
                                        backgroundColor: Colors.transparent,
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
                                  .padding(
                                      const EdgeInsets.fromLTRB(10, 20, 10, 10))
                                  .make(),
                            ),
                          ],
                        )
                            .box
                            .gray100
                            .roundedSM
                            .padding(const EdgeInsets.all(10))
                            .make(),
                      )
                      .toList(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
