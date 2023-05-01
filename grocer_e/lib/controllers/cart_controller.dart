import 'package:grocer_e/consts/consts.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var totalCartPrice = 0.obs;

  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalCodeController = TextEditingController();
  var phoneController = TextEditingController();

  calculateTotalCartPrice(data) {
    totalCartPrice.value = 0;

    for (var i = 0; i < data.length; i++) {
      totalCartPrice.value =
          totalCartPrice.value + int.parse(data[i]['totalPrice'].toString());
    }
  }

}

