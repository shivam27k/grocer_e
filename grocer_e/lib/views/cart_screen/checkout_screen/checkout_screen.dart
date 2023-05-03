// import 'package:grocer_e/components/bg_widget.dart';
// import 'package:grocer_e/consts/consts.dart';
// import 'package:grocer_e/controllers/address_controller.dart';
// import 'package:grocer_e/views/cart_screen/checkout_screen/order_detail_screen.dart';
// import 'package:grocer_e/views/user_profile_screen/saved_address_screen/add_delivery_address.dart';
// // import 'package:grocer_e/views/user_profile_screen/saved_address_screen/delivery_address_card.dart';

// class CheckoutScreen extends StatefulWidget {
//   const CheckoutScreen({super.key});

//   @override
//   State<CheckoutScreen> createState() => _CheckoutScreenState();
// }

// class _CheckoutScreenState extends State<CheckoutScreen> {
//   // bool isAddress = false;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: bgWidget(
//         child: Scaffold(
//           floatingActionButton: FloatingActionButton(
//             backgroundColor: blueColor,
//             onPressed: () => {
//               Navigator.of(context).push(
//                 PageRouteBuilder(
//                   pageBuilder: (BuildContext context,
//                       Animation<double> animation,
//                       Animation<double> secondaryAnimation) {
//                     return const AddDeliveryAddress();
//                   },
//                   transitionsBuilder: (BuildContext context,
//                       Animation<double> animation,
//                       Animation<double> secondaryAnimation,
//                       Widget child) {
//                     return Align(
//                       child: SlideTransition(
//                         position: Tween(
//                                 begin: const Offset(1.0, 0.0),
//                                 end: const Offset(0.0, 0.0))
//                             .animate(animation),
//                         child: child,
//                       ),
//                     );
//                   },
//                   transitionDuration: const Duration(milliseconds: 200),
//                 ),
//               )
//             },
//             child: const Icon(Icons.add),
//           ),
//           appBar: AppBar(
//             title: "Confirm Address".text.make(),
//           ),
//           bottomNavigationBar: Container(
//             decoration: const BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 8,
//                   offset: Offset(0, 10),
//                   color: blackColor,
//                   spreadRadius: -9,
//                 ),
//               ],
//             ),
//             height: 48,
//             margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//             child: TextButton(
//               style: TextButton.styleFrom(
//                 backgroundColor: blueColor,
//                 textStyle: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).push(
//                   PageRouteBuilder(
//                     pageBuilder: (BuildContext context,
//                         Animation<double> animation,
//                         Animation<double> secondaryAnimation) {
//                       return const OrderDetailScreen();
//                     },
//                     transitionsBuilder: (BuildContext context,
//                         Animation<double> animation,
//                         Animation<double> secondaryAnimation,
//                         Widget child) {
//                       return Align(
//                         child: SlideTransition(
//                           position: Tween(
//                                   begin: const Offset(1.0, 0.0),
//                                   end: const Offset(0.0, 0.0))
//                               .animate(animation),
//                           child: child,
//                         ),
//                       );
//                     },
//                     transitionDuration: const Duration(milliseconds: 200),
//                   ),
//                 );
//               },
//               child: const Text(
//                 "Proceed to pay",
//                 style: TextStyle(color: whiteColor),
//               ),
//             ),
//           ),
//           body: ListView(
//             children: [
//               const ListTile(
//                 title: Text("Deliver To",
//                     style: TextStyle(
//                         color: blueColor,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold)),
//                 visualDensity: VisualDensity(horizontal: -4, vertical: 0),
//                 minLeadingWidth: 10,
//                 leading: Icon(Icons.place, size: 23, color: blueColor),
//               ),
//               const Divider(),
//               Column(
//                 children: const [
//                   AddressList(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
