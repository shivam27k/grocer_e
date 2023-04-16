import 'package:get/get.dart';

class CartController extends GetxController {
  var totalCartPrice = 0.obs;

  calculateTotalCartPrice(data) {
    totalCartPrice.value = 0;

    for (var i = 0; i < data.length; i++) {
      totalCartPrice.value =
          totalCartPrice.value + int.parse(data[i]['totalPrice'].toString());
    }
  }
}
