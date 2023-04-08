import 'package:grocer_e/consts/consts.dart';

Widget selectLocation(BuildContext context) {
  // using velocity X here
  return GestureDetector(
    onTap: () => {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.list,
                color: whiteColor,
                size: 20,
              ),
              (context.screenWidth * 0.01).widthBox,
              const Text(
                "Select Address",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
