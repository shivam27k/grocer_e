import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/services/firestore_services.dart';
import 'package:grocer_e/views/user_profile_screen/orders_screen/order_summary.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: "Orders".text.make(),
        ),
        body: StreamBuilder(
            stream: FireStoreServices.getOrders(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(logoTextColor),
                ));
              } else if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    "No Orders Yet!",
                    style: TextStyle(
                        color: darkFontGrey,
                        decoration: TextDecoration.none,
                        fontFamily: regular,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ).box.margin(const EdgeInsets.only(top: 50)).make();
              } else {
                var data = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${index + 1}.  Order ID: ${data[index]['order_code']}",
                              style: const TextStyle(
                                  color: darkFontGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          5.heightBox,
                          Text(
                            DateFormat().add_yMMMd().format(
                                  (data[index]['order_date'].toDate()),
                                ),
                          ).box.padding(const EdgeInsets.only(left: 21)).make(),
                        ],
                      ).box.margin(const EdgeInsets.only(bottom: 5)).make(),
                      subtitle: Row(
                        children: [
                          const Text(
                            "Total Amount: ",
                            style: TextStyle(color: darkFontGrey),
                          ),
                          const Icon(Icons.currency_rupee,
                              size: 12, color: greenColor),
                          Text(
                            "${data[index]['total_amount']}",
                            style: const TextStyle(color: greenColor),
                          ),
                        ],
                      ).box.padding(const EdgeInsets.only(left: 21)).make(),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return OrderSummary(
                                  data: data[index],
                                  orderID: "${data[index]['order_code']}",
                                );
                              },
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return Align(
                                  child: SlideTransition(
                                    position: Tween(
                                            begin: const Offset(1.0, 0.0),
                                            end: const Offset(0.0, 0.0))
                                        .animate(animation),
                                    child: child,
                                  ),
                                );
                              },
                              transitionDuration:
                                  const Duration(milliseconds: 200),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    );
                  },
                )
                    .box
                    .margin(const EdgeInsets.fromLTRB(15, 15, 15, 25))
                    .outerShadowSm
                    .color(appBgColor)
                    .make();
              }
            }),
      ),
    ));
  }
}
