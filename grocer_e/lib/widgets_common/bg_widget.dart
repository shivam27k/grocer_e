import 'package:grocer_e/consts/consts.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
      color: appBgColor,
    ),
    child: child,
  );
}
