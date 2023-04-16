import 'package:grocer_e/consts/consts.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text
          .fontFamily(regular)
          .color(whiteColor)
          .fontWeight(FontWeight.w900)
          .make(),
      5.heightBox,
      title!.text
          .color(whiteColor)
          .fontFamily(regular)
          .fontWeight(FontWeight.w400)
          .make()
    ],
  )
      .box
      .color(blueColor)
      .roundedSM
      .width(width)
      .shadowSm
      .height(60)
      .padding(const EdgeInsets.all(5))
      .make();
}

// (context.screenWidth / 4.2)