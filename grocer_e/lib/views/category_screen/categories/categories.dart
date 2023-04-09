import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';

class Categories extends StatelessWidget {
  final String? title;
  const Categories({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 41,
                      width: 41,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.navigate_before,
                        color: whiteColor,
                        size: 40,
                      ).onTap(() {
                        Navigator.pop(context);
                      }),
                    ),
                    (context.screenWidth * 0.45).widthBox,
                    Container(
                      height: 41,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "Select Address",
                        style: TextStyle(
                          fontFamily: regular,
                          color: whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                20.heightBox,
                Text(
                  title!,
                  style: const TextStyle(
                    fontFamily: regular,
                    color: blueColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                const Text("hi"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
