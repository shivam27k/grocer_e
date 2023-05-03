// import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/components/loading_indicator.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/controllers/shop_controller.dart';
import 'package:grocer_e/services/firestore_services.dart';
import 'package:grocer_e/views/home_screen/tabs/retail_tab/shops/shops_products.dart';
// import 'package:grocer_e/controllers/shop_controller.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  navigateShops(shopsName, shops) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Shops(
            title: shopsName,
            image: shops,
          );
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          var tween =
              Tween(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
                  .chain(CurveTween(curve: Curves.ease));
          return Align(
            child: SlideTransition(
              position: animation.drive(tween),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  Set<int> selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ShopController());

    return SafeArea(
      child: bgWidget(
        child: Scaffold(
          appBar: AppBar(
            title: "Your Favorite Shops".text.make(),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: StreamBuilder(
              stream: FireStoreServices.getFavorites(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: loadingIndicator(),
                  );
                } else if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      "No Shops Found!",
                      style: TextStyle(
                          color: darkFontGrey,
                          decoration: TextDecoration.none,
                          fontFamily: regular,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                      .box
                      .margin(const EdgeInsets.fromLTRB(15, 50, 15, 15))
                      .make();
                } else {
                  var data = snapshot.data!.docs;

                  return Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      reverse: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 15,
                        mainAxisExtent: 150,
                      ),
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              data[index]['s_image'],
                              // shopImage1,
                              height: 160,
                              width: 160,
                              fit: BoxFit.cover,
                            ).onTap(() {
                              navigateShops(
                                data[index]['s_name'],
                                data[index]['s_image'],
                              );
                            }),
                            // 10.widthBox,
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          // shopsName[index],
                                          data[index]['s_name'],
                                          softWrap: false,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21,
                                          ),
                                        ).onTap(() {
                                          navigateShops(
                                            data[index]['s_name'],
                                            data[index]['s_image'],
                                          );
                                        }),
                                      ),
                                      5.widthBox,
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (selectedIndices
                                                .contains(index)) {
                                              selectedIndices.remove(index);
                                              controller.removeFromWishList(
                                                  data[index].id, context);
                                              controller.isFav(false);
                                            } else {
                                              selectedIndices.add(index);
                                              controller.addToWishList(
                                                  data[index].id, context);
                                              controller.isFav(true);
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 36,
                                          alignment: Alignment.center,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: lightGrey,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Icon(
                                            Icons.favorite,
                                            color: controller
                                                    .checkIfFav(data[index])
                                                ? Colors.red
                                                : Colors.grey,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  UnconstrainedBox(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: logoTextColor,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      // width: 45,
                                      height: 15,
                                      child: Text(
                                        data[index]['s_category'],
                                        overflow: TextOverflow.visible,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  15.heightBox,
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: greenColor,
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                        width: 45,
                                        height: 15,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 14,
                                              color: whiteColor,
                                            ),
                                            1.widthBox,
                                            Text(
                                              data[index]['s_rating'],
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: whiteColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      8.widthBox,
                                      const Icon(
                                        Icons.place,
                                        color: logoTextColor,
                                        size: 14,
                                      ),
                                      Text(
                                        "${data[index]['s_distance']} km",
                                        // distance[index],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      5.widthBox,
                                      const Icon(
                                        Icons.timer,
                                        color: logoTextColor,
                                        size: 14,
                                      ),
                                      Text(
                                        "${data[index]['s_time']} mins",
                                        // time[index],
                                        softWrap: false,
                                        overflow: TextOverflow.fade,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ).onTap(() {
                                    navigateShops(
                                      data[index]['s_name'],
                                      data[index]['s_image'],
                                    );
                                  }),
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
                            .margin(const EdgeInsets.fromLTRB(15, 0, 15, 0))
                            .make();
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
