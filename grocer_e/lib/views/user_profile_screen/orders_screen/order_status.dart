import 'package:grocer_e/consts/consts.dart';

Widget orderStatus({icon, color, title, showDone}) {
  return ListTile(
    leading: Icon(icon, color: color).box.border(color: color).make(),
    // contentPadding: const EdgeInsets.only(left: 20, right: 20),
    title: Container(
      height: 0.2,
      color: blackColor,
    ),
    trailing: SizedBox(
      width: 125,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title", style: const TextStyle(fontWeight: FontWeight.w600)),
          showDone
              ? Icon(Icons.done, color: color)
                  .box
                  .border(color: color)
                  .roundedFull
                  .make()
              : Container(),
        ],
      ),
    ),
  );
}
