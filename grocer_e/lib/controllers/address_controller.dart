import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocer_e/components/loading_indicator.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/consts/firebase_consts.dart';
import 'package:grocer_e/views/user_profile_screen/saved_address_screen/delivery_address_card.dart';

class AddressList extends StatefulWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('add_delivery_address')
          .where('address_of', isEqualTo: currentUser!.uid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: loadingIndicator());
        } else if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              "No Address Found!",
              style: TextStyle(
                color: darkFontGrey,
                decoration: TextDecoration.none,
                fontFamily: regular,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        } else {
          var data = snapshot.data!.docs;
          return SizedBox(
            height: MediaQuery.of(context).size.height *
                0.5, // Set the height to whatever value you want
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => {},
                  child: DeliveryAddressCard(
                    title:
                        "${data[index]['firstName']} ${data[index]['lastName']}",
                    address:
                        "${data[index]['addressLine1']}, ${data[index]['addressLine2']}, ${data[index]['area']}, ${data[index]['pinCode']}",
                    addressType: "${data[index]['addressType']}".trim(),
                    phNumber: "${data[index]['phNumber']}",
                    docId: data[index].id,
                    color: redColor,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
