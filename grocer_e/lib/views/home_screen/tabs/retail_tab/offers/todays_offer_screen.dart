import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';

class TodaysOfferScreen extends StatelessWidget {
  const TodaysOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: bgWidget(
        child: Scaffold(
          appBar: AppBar(title: const Text("Today's Offer")),
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
                        './assets/images/deliveryBoy.png',
                      ).box.padding(const EdgeInsets.all(15)).make(),
                      const SizedBox(
                        width: 270,
                        child: Text(
                          "Delivery charges 30% off today on orders above Rs. 200!",
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
                        './assets/images/deliveryBoy.png',
                      ).box.padding(const EdgeInsets.all(15)).make(),
                      const SizedBox(
                        width: 270,
                        child: Text(
                          "Surprise gifts for customers who order above Rs. 500!",
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
