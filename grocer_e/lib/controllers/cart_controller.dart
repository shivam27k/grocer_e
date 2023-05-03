import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:grocer_e/consts/consts.dart';
import 'package:get/get.dart';
import 'package:grocer_e/consts/firebase_consts.dart';
import 'package:grocer_e/controllers/add_address_controller.dart';

class CartController extends GetxController {
  var totalCartPrice = 0.obs;

  late dynamic productSnapShot;
  var products = [];

  calculateTotalCartPrice(data) {
    totalCartPrice.value = 0;

    for (var i = 0; i < data.length; i++) {
      totalCartPrice.value =
          totalCartPrice.value + int.parse(data[i]['totalPrice'].toString());
    }
  }

  var random = 2700000000 +
      Random().nextInt(10000000) +
      Random().nextInt(10000) +
      Random().nextInt(123456);

  var controller = Get.put(CheckoutProvider());

  placeOrder(name, phNumber, addressLine1, addressLine2, area, pinCode,
      orderPaymentMethod, totalAmount, deliveryAmount) async {
    await getProductDetails();

    await firestore.collection("orders").doc().set({
      'order_code': "$random",
      'order_date': FieldValue.serverTimestamp(),
      'order_by_id': currentUser!.uid,
      'order_by_name': name,
      'order_by_email': currentUser!.email,
      'order_by_phNumber': phNumber,
      'order_by_addressLine1': addressLine1,
      'order_by_addressLine2': addressLine2,
      'order_by_area': area,
      'order_by_pinCode': pinCode,
      'payment_method': orderPaymentMethod,
      'order_placed': true,
      'order_confirmed': false,
      'order_on_delivery': false,
      'order_delivered': false,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products),
      'delivery_amount': deliveryAmount,
    });
  }

  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapShot.length; i++) {
      products.add({
        'image': productSnapShot[i]['image'],
        'quantity': productSnapShot[i]['quantity'],
        'title': productSnapShot[i]['title'],
        'total_price': productSnapShot[i]['totalPrice'],
      });
    }
  }

  clearCart() {
    for (var i = 0; i < productSnapShot.length; i++) {
      firestore.collection(cartCollection).doc(productSnapShot[i].id).delete();
    }
  }
}
