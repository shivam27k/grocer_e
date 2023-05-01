import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grocer_e/components/loading_indicator.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/consts/firebase_consts.dart';

class CheckoutProvider extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phNumber = TextEditingController();
  TextEditingController addressLine1 = TextEditingController();
  TextEditingController addressLine2 = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController setLocation = TextEditingController();

  void validator(context, addressType) async {
    if (firstName.text.isEmpty) {
      VxToast.show(context, msg: "First name is empty!");
    } else if (lastName.text.isEmpty) {
      VxToast.show(context, msg: "Last name is empty!");
    } else if (phNumber.text.isEmpty) {
      VxToast.show(context, msg: "Phone number is empty!");
    } else if (addressLine1.text.isEmpty) {
      VxToast.show(context, msg: "Address Line is empty!");
    } else if (pinCode.text.isEmpty) {
      VxToast.show(context, msg: "Enter your pin code!");
    } else {
      loadingIndicator();
      await FirebaseFirestore.instance
          .collection("add_delivery_address")
          .doc()
          .set({
        "address_of": currentUser!.uid,
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
        "phNumber": phNumber.text.trim(),
        "addressLine1": addressLine1.text.trim(),
        "addressLine2": addressLine2.text.trim(),
        "area": area.text.trim(),
        "pinCode": pinCode.text.trim(),
        "addressType": addressType.toString(),
      }).then((value) async {
        VxToast.show(context, msg: "Delivery address added!");
        Navigator.pop(context);
        firstName.clear();
        lastName.clear();
        phNumber.clear();
        addressLine1.clear();
        addressLine2.clear();
        area.clear();
        pinCode.clear();
      });
    }
  }
}
