// ignore_for_file: constant_identifier_names
import 'package:get/get.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/components/my_text_field.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/controllers/add_address_controller.dart';
// import 'package:provider/provider.dart';

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({super.key});

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

List addressTypes = ["Home", "Work", "Other"];

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var controller = Get.put(CheckoutProvider());

  var myType = addressTypes[0];
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(title: const Text("Add new address")),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                offset: Offset(0, 10),
                color: blackColor,
                spreadRadius: -9,
              ),
            ],
          ),
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: blueColor,
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {
              controller.validator(context, myType);
            },
            child: const Text(
              "Add address",
              style: TextStyle(color: whiteColor),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: ListView(
            children: [
              InkWell(
                onTap: () => {},
                child: const SizedBox(
                  // height: 50,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fill address details",
                        style: TextStyle(
                          fontSize: 20,
                          color: blueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                color: darkFontGrey,
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  SizedBox(
                    width: (context.screenWidth * 0.77),
                    child: const Text(
                      "First Name",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  3.heightBox,
                  MyTextField(
                    controller: controller.firstName,
                    hintText: "Enter your first name",
                    obscureText: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    width: (context.screenWidth * 0.77),
                    child: const Text(
                      "Last Name",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  3.heightBox,
                  MyTextField(
                    controller: controller.lastName,
                    hintText: "Enter your last name",
                    obscureText: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    width: (context.screenWidth * 0.77),
                    child: const Text(
                      "Phone Number",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  3.heightBox,
                  MyTextField(
                    controller: controller.phNumber,
                    hintText: "Enter 10 digits",
                    obscureText: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    width: (context.screenWidth * 0.77),
                    child: const Text(
                      "Address Line 1",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  3.heightBox,
                  MyTextField(
                    controller: controller.addressLine1,
                    hintText: "Enter your society, street",
                    obscureText: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    width: (context.screenWidth * 0.77),
                    child: const Text(
                      "Address Line 2",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  3.heightBox,
                  MyTextField(
                    controller: controller.addressLine2,
                    hintText: "Enter your locality",
                    obscureText: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    width: (context.screenWidth * 0.77),
                    child: const Text(
                      "Area",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  3.heightBox,
                  MyTextField(
                    controller: controller.area,
                    hintText: "Enter your area",
                    obscureText: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    width: (context.screenWidth * 0.77),
                    child: const Text(
                      "Pin Code",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  3.heightBox,
                  MyTextField(
                    controller: controller.pinCode,
                    hintText: "Enter your pin code",
                    obscureText: false,
                  ),
                ],
              ),
              InkWell(
                onTap: () => {},
                child: const SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Set location",
                        style: TextStyle(
                          fontSize: 20,
                          color: blueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(color: darkFontGrey),
              const ListTile(
                contentPadding: EdgeInsets.only(left: 35),
                title: Text(
                  "Address Type",
                  style: TextStyle(
                    fontSize: 16,
                    color: blueColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RadioListTile(
                value: addressTypes[0],
                groupValue: myType,
                title: const Text("Home",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                secondary: const Icon(Icons.home, color: blueColor),
                onChanged: (value) {
                  setState(() {
                    myType = addressTypes[0];
                    value = myType;
                  });
                },
              ),
              RadioListTile(
                value: addressTypes[1],
                groupValue: myType,
                title: const Text("Work",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                secondary: const Icon(Icons.work, color: blueColor),
                onChanged: (value) {
                  setState(() {
                    myType = addressTypes[1];
                    value = myType;
                  });
                },
              ),
              RadioListTile(
                value: addressTypes[2],
                groupValue: myType,
                title: const Text("Other",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                secondary: const Icon(Icons.public, color: blueColor),
                onChanged: (value) {
                  setState(() {
                    myType = addressTypes[2];
                    value = myType;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
