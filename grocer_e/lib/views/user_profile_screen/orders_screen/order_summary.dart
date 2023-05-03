import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:intl/intl.dart';
import 'package:grocer_e/views/user_profile_screen/orders_screen/order_place_details.dart';
import 'package:grocer_e/views/user_profile_screen/orders_screen/order_status.dart';

class OrderSummary extends StatelessWidget {
  final dynamic data;
  final String orderID;
  const OrderSummary({super.key, required this.orderID, required this.data});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order ID $orderID"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  orderStatus(
                      color: redColor,
                      icon: Icons.done,
                      title: "Placed",
                      showDone: data['order_placed']),
                  orderStatus(
                      color: blueColor,
                      icon: Icons.thumb_up_alt,
                      title: "Confirmed",
                      showDone: data['order_confirmed']),
                  orderStatus(
                      color: darkFontGrey,
                      icon: Icons.delivery_dining,
                      title: "Out for delivery",
                      showDone: data['order_on_delivery']),
                  orderStatus(
                      color: greenColor,
                      icon: Icons.receipt_long_rounded,
                      title: "Delivered",
                      showDone: data['order_delivered']),
                  10.heightBox,
                  const Divider(),
                  10.heightBox,
                  Column(
                    children: [
                      orderPlaceDetails(
                        title: "Order ID",
                        titleDetail: data['order_code'],
                        title2: "Shipping Method",
                        titleDetail2: "Home Delivery",
                      ),
                      15.heightBox,
                      orderPlaceDetails(
                        title: "Order Date",
                        titleDetail: DateFormat()
                            .add_yMMMd()
                            .format((data['order_date'].toDate())),
                        title2: "Payment Method",
                        titleDetail2: data['payment_method'],
                      ),
                      15.heightBox,
                      orderPlaceDetails(
                        title: "Payment Status",
                        titleDetail: "Unpaid",
                        title2: "Delivery Status",
                        titleDetail2: "Order Placed",
                      ),
                      15.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Shipping Details",
                                style: TextStyle(
                                    color: blackColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('${data['order_by_name']}'),
                              Text('${data['order_by_email']}'),
                              Text('${data['order_by_phNumber']}'),
                              Text('${data['order_by_addressLine1']}'),
                              Text('${data['order_by_addressLine2']}'),
                              Text('${data['order_by_area']}'),
                              Text('${data['order_by_pinCode']}'),
                            ],
                          ),
                          SizedBox(
                            width: 97,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Total Amount",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Row(
                                  children: [
                                    const Icon(Icons.currency_rupee,
                                        color: greenColor, size: 13),
                                    Text(data['total_amount'],
                                        style: const TextStyle(
                                            color: greenColor, fontSize: 15)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                      .box
                      .outerShadowMd
                      .color(appBgColor)
                      .padding(const EdgeInsets.all(10))
                      .roundedSM
                      .make(),
                  10.heightBox,
                  const Divider(),
                  10.heightBox,
                  Column(
                    children: [
                      const Text(
                        "Ordered Products Breakdown",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      10.heightBox,
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(data['orders'].length, (index) {
                          return orderPlaceDetails(
                            title: data['orders'][index]['title'],
                            titleDetail:
                                "${data['orders'][index]['quantity']} items",
                            title2:
                                "Rs. ${data['orders'][index]['total_price']}",
                            titleDetail2: "",
                          )
                              .box
                              .margin(const EdgeInsets.only(bottom: 10))
                              .make();
                        }),
                      )
                    ],
                  )
                      .box
                      .outerShadowMd
                      .color(appBgColor)
                      .roundedSM
                      .padding(const EdgeInsets.fromLTRB(15, 5, 15, 5))
                      .make(),
                ],
              ),
            ],
          ).box.padding(const EdgeInsets.fromLTRB(15, 5, 15, 5)).make(),
        ),
      ),
    );
  }
}
