import 'package:grocer_e/consts/consts.dart';

Widget orderPlaceDetails({title, titleDetail, title2, titleDetail2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(
            "$titleDetail",
            style: const TextStyle(color: redColor),
          ),
        ],
      ),
      SizedBox(
        width: 97,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$title2",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(
              "$titleDetail2",
              style: const TextStyle(color: redColor),
            ),
          ],
        ),
      )
    ],
  );
}
