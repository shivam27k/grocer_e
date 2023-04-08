import 'package:get/get.dart';
import 'package:grocer_e/consts/consts.dart';

Widget featuredButton({String? title, icon}) {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset(
        icon,
        width: 90,
        height: 80,
        fit: BoxFit.fill,
      ).marginAll(5),
      10.widthBox,
      Text(
        title!,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ).flexible(),
    ],
  )
      .box
      .color(blueColor)
      .withConstraints(
        const BoxConstraints(maxWidth: 250),
      )
      .margin(const EdgeInsets.all(8))
      .padding(const EdgeInsets.fromLTRB(5, 2, 5, 2))
      .roundedSM
      .outerShadowSm
      .make();
}
