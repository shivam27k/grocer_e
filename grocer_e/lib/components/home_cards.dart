import 'package:grocer_e/consts/consts.dart';

Widget homeCards({width, height, icon, String? title, onPress}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
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
          Icon(icon, size: 25, color: logoTextColor),
          10.heightBox,
          Text(
            title!,
            style: const TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ).box.rounded.color(blueColor).size(width, height).make(),
    ),
  );
}
