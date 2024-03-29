import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grocer_e/components/add_button_content.dart';
// import 'package:grocer_e/components/home_cards.dart';
import 'package:grocer_e/components/loading_indicator.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/controllers/shop_controller.dart';
import 'package:grocer_e/services/firestore_services.dart';
import 'package:grocer_e/views/home_screen/tabs/retail_tab/offers/flash_sale_screen.dart';
import 'package:grocer_e/views/home_screen/tabs/retail_tab/offers/todays_offer_screen.dart';
import 'package:grocer_e/views/home_screen/tabs/retail_tab/shops/shops_products.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RetailTab extends StatefulWidget {
  const RetailTab({super.key});

  @override
  State<RetailTab> createState() => _RetailTabState();
}

class _RetailTabState extends State<RetailTab> {
  int activeIndex = 0;
  final sliderImages = [
    sliderImg1,
    sliderImg2,
    sliderImg3,
    sliderImg4,
    sliderImg5
  ];

  bool isPressed = false;

  final featuredImages2 = [
    aashirvaadAtta,
    potato,
    onions,
    dairyMilk,
    kitKat,
    lorealShampoo,
  ];

  final featuredTitle2 = [
    "Aashirvaad Atta",
    "Potato",
    "Onions",
    "Dairy Milk",
    "Kit-Kat",
    "Loreal"
  ];

  final featuredCategory = [
    "Baking",
    "Vegetables",
    "Vegetables",
    "Snacks",
    "Snacks",
    "Personal Care",
  ];

  final featuredPrice = ["260", "20", "15", "50", "50", "110"];

  final featuredQuantity = ["5kg", "1kg", "1kg", "1 Pc", "1 Pc", "1 Pc"];

  final featuredAvailable = ["40", "50", "100", "30", "178", "32"];

  final featuredStore = [
    "Rajendra Grocer Store",
    "Suvidha Supermarket",
    "Smart Point",
    "Narayan Grocery Store",
    "Reliance Fresh",
    "Sinha Supermart",
  ];

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

  todaysOffer() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const TodaysOfferScreen();
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

  flashSale() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const FlashSaleScreen();
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

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 190,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (
                      index,
                      reason,
                    ) =>
                        setState(
                      () => activeIndex = index,
                    ),
                  ),
                  itemCount: sliderImages.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    final sliderImage = sliderImages[index];
                    return buildImage(sliderImage, index);
                  },
                ),
                18.heightBox,
                buildIndicator(),
              ],
            ),
          ),
          30.heightBox,
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 16,
                    offset: Offset(0, 10),
                    color: blackColor,
                    spreadRadius: -9,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.local_offer, size: 35, color: logoTextColor)
                      .onTap(() {
                    todaysOffer();
                  }),
                  10.heightBox,
                  const Text(
                    "Today's Offers",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ).onTap(() {
                    todaysOffer();
                  }),
                ],
              )
                  .box
                  .rounded
                  .color(blueColor)
                  .size(context.screenWidth / 2.5, context.screenHeight * 0.1)
                  .make(),
            ),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 16,
                    offset: Offset(0, 10),
                    color: blackColor,
                    spreadRadius: -9,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.hourglass_top,
                          size: 35, color: logoTextColor)
                      .onTap(() {
                    flashSale();
                  }),
                  10.heightBox,
                  const Text(
                    "Flash Sale",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ).onTap(() {
                    flashSale();
                  }),
                ],
              )
                  .box
                  .rounded
                  .color(blueColor)
                  .size(context.screenWidth / 2.5, context.screenHeight * 0.1)
                  .make(),
            ),
          ]),
          25.heightBox,
          Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: blueColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Featured Products",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  15.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                        featuredCategory.length,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              featuredImages2[index],
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              featuredTitle2[index],
                              style: const TextStyle(
                                  color: blueColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            UnconstrainedBox(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.fromLTRB(2, 1, 2, 1),
                                decoration: BoxDecoration(
                                  color: logoTextColor,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Text(
                                  featuredCategory[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            7.heightBox,
                            Wrap(
                              spacing: 80,
                              children: [
                                Text(
                                  featuredPrice[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                                // (context.screenWidth / 4.3).widthBox,
                                Text(
                                  featuredQuantity[index],
                                  style: const TextStyle(
                                      color: blueColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        )
                            .box
                            .color(whiteColor)
                            .roundedSM
                            .padding(const EdgeInsets.all(15))
                            .margin(const EdgeInsets.fromLTRB(10, 0, 10, 0))
                            .make()
                            .onTap(() {
                          showModalBottomSheet(
                            isDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return WillPopScope(
                                onWillPop: () async => false,
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                  height: 260,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AddButtonContent(
                                        productTitle: featuredTitle2[index],
                                        productCategory:
                                            featuredCategory[index],
                                        productPrice: featuredPrice[index],
                                        productQuantity:
                                            featuredQuantity[index],
                                        productAvailable:
                                            featuredAvailable[index],
                                        maxAvailable: featuredAvailable[index],
                                        totalPrice: featuredPrice[index],
                                        productImage: featuredImages2[index],
                                        storeName: featuredStore[index],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ).toList(),
                    ),
                  ),
                ],
              )),
          35.heightBox,
          Container(
            // height: 100,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Shops near you",
                  style: TextStyle(
                    color: blueColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ).marginOnly(left: 5),
                30.heightBox,
                StreamBuilder(
                  stream: FireStoreServices.getShops('Retailer'),
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
                      );
                    } else {
                      var data = snapshot.data!.docs;

                      return GridView.builder(
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
                                        2.widthBox,
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
                                          borderRadius:
                                              BorderRadius.circular(2),
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
          ),
        ],
      ),
    );
  }

  Widget buildImage(String sliderImage, int index) => Container(
        color: appBgColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            sliderImage,
            fit: BoxFit.contain,
          ),
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: sliderImages.length,
        effect: const JumpingDotEffect(
          dotWidth: 8,
          activeDotColor: blueColor,
          dotColor: fontGrey,
          dotHeight: 8,
        ),
      );
}
