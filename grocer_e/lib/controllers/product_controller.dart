// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/consts/firebase_consts.dart';
// import 'package:grocer_e/consts/consts.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var totalPrice = 0.obs;

  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  //add to cart

  addToCart({title, image, storeName, quantity, totalPrice, context}) async {
    await firestore.collection(cartCollection).doc().set({
      'title': title,
      'image': image,
      'storeName': storeName,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'added_by': currentUser!.uid,
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }
}
