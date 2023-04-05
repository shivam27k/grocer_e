import 'package:carousel_slider/carousel_slider.dart';
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
            50.heightBox,
            Container(
              alignment: Alignment.center,
              height: 100,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: blueColor,
              ),
            ),
            25.heightBox,
            Container(
              alignment: Alignment.center,
              height: 100,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: blueColor,
              ),
            ),
            25.heightBox,
            Container(
              alignment: Alignment.center,
              height: 100,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: blueColor,
              ),
            ),
            25.heightBox,
            Container(
              alignment: Alignment.center,
              height: 100,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: blueColor,
              ),
            ),
            25.heightBox,
            Container(
              alignment: Alignment.center,
              height: 100,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: blueColor,
              ),
            ),
            25.heightBox,
            Container(
              alignment: Alignment.center,
              height: 100,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: blueColor,
              ),
            ),
            25.heightBox,
            Container(
              alignment: Alignment.center,
              height: 100,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: blueColor,
              ),
            ),
            25.heightBox,
            Container(
              alignment: Alignment.center,
              height: 100,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: blueColor,
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
