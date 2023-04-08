import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:grocer_e/components/featured_button.dart';
import 'package:grocer_e/components/home_cards.dart';
import 'package:grocer_e/consts/consts.dart';
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

  final featuredImages = [personalCare, cannedGoods, bakeryBread];
  final featuredImages2 = [
    aashirvaadAtta,
    potato,
    onions,
    dairyMilk,
    kitKat,
    lorealShampoo,
  ];
  final featuredTitle = ["Personal Care", "Canned Goods", "Bread & Bakery"];
  final featuredTitle2 = [
    "Aashirvaad Atta",
    "Potato",
    "Onions",
    "Dairy Milk",
    "Kit-Kat",
    "Loreal"
  ];
  final featuredPrice = [
    "Rs. 350",
    "Rs. 20",
    "Rs. 15",
    "Rs. 50",
    "Rs. 50",
    "Rs. 110"
  ];
  final featuredQuantity = ["5kg", "1kg", "1kg", "1 Pc", "1 Pc", "1 Pc"];

  final shops = [
    shopImage1,
    shopImage2,
    shopImage3,
    shopImage4,
    shopImage5,
    shopImage6,
    shopImage7,
    shopImage8,
    shopImage9,
    shopImage10
  ];
  final shopsName = [
    "Rajendra Grocer Store",
    "Suvidha Supermarket",
    "Smart Point",
    "Narayan Grocery Store",
    "Reliance Fresh",
    "Sinha Supermart",
    "Bhim Prasad Kirana Store",
    "Apna Supermart",
    "Daily Basket",
    "A. S. Enterprise",
  ];

  final ratings = [
    "4.5",
    "4.8",
    "4.3",
    "3.9",
    "3.5",
    "4.1",
    "3.8",
    "4.2",
    "3.1",
    "3.8",
  ];
  final distance = [
    "1.3km",
    "1.9km",
    "2.7km",
    "2.9km",
    "3.1km",
    "3.5km",
    "4.0km",
    "4.5km",
    "5.2km",
    "5.7km",
  ];
  final time = [
    "20 mins",
    "25 mins",
    "30 mins",
    "30 mins",
    "35 mins",
    "38 mins",
    "40 mins",
    "40 mins",
    "42 mins",
    "42 mins",
  ];

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                2,
                (index) => homeCards(
                    height: context.screenHeight * 0.08,
                    width: context.screenWidth / 2.5,
                    icon: index == 0 ? Icons.local_offer : Icons.hourglass_top,
                    title: index == 0 ? "Today's Offers" : "Flash Sale"),
              ),
            ),
            25.heightBox,
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Featured Categories",
                    style: TextStyle(
                      color: blueColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => Column(
                        children: [
                          featuredButton(
                            icon: featuredImages[index],
                            title: featuredTitle[index],
                          ),
                        ],
                      ),
                    ).toList(),
                  ).paddingAll(10),
                ),
              ],
            ),
            20.heightBox,
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
                    child: Row(
                      children: List.generate(
                        6,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
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
                            7.heightBox,
                            Row(
                              children: [
                                Text(
                                  featuredPrice[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                                (context.screenWidth / 4.3).widthBox,
                                Text(
                                  featuredQuantity[index],
                                  style: const TextStyle(
                                      color: blueColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        )
                            .box
                            .color(whiteColor)
                            .roundedSM
                            .padding(const EdgeInsets.all(15))
                            .margin(const EdgeInsets.fromLTRB(10, 0, 10, 0))
                            .make(),
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
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
                  ),
                  30.heightBox,
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 150,
                    ),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            shops[index],
                            // shopImage1,
                            height: 160,
                            width: 160,
                          ),
                          10.widthBox,
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shopsName[index],
                                  softWrap: false,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: logoTextColor,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  width: 45,
                                  height: 15,
                                  child: const Text(
                                    "Retailer",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
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
                                        borderRadius: BorderRadius.circular(2),
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
                                            ratings[index],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: whiteColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    10.widthBox,
                                    const Icon(
                                      Icons.place,
                                      color: logoTextColor,
                                      size: 14,
                                    ),
                                    Text(
                                      distance[index],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    10.widthBox,
                                    const Icon(
                                      Icons.timer,
                                      color: logoTextColor,
                                      size: 14,
                                    ),
                                    Text(
                                      time[index],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
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
                          .make();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      );

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
