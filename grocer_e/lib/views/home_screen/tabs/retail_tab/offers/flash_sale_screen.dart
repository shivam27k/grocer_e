import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';

class FlashSaleScreen extends StatelessWidget {
  const FlashSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: bgWidget(
        child: Scaffold(
          appBar: AppBar(title: const Text("Flash Sale")),
          body: Container(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        './assets/images/amulMilk.png',
                      ).box.padding(const EdgeInsets.all(15)).make(),
                      const SizedBox(
                        width: 270,
                        child: Text(
                          "Amul Milk now 15% off on orders of more quantity than 3!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).box.outerShadowXl.make(),
                15.heightBox,
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        './assets/images/potato.png',
                      ).box.padding(const EdgeInsets.all(15)).make(),
                      const SizedBox(
                        width: 270,
                        child: Text(
                          "Potato now 20% off on orders above 5kgs!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).box.outerShadowXl.make(),
                10.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
