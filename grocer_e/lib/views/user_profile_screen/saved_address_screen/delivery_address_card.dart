import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocer_e/consts/consts.dart';

class DeliveryAddressCard extends StatelessWidget {
  final String title;
  final String address;
  final String phNumber;
  final String addressType;
  final dynamic docId;
  final Color color;
  const DeliveryAddressCard(
      {super.key,
      required this.title,
      required this.address,
      required this.color,
      required this.phNumber,
      required this.docId,
      required this.addressType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 10,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: blueColor),
              ),
              UnconstrainedBox(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      addressType,
                      style: const TextStyle(
                          fontSize: 15,
                          color: logoTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          leading: Container(
            decoration: BoxDecoration(
                border: Border.all(color: blueColor),
                borderRadius: BorderRadius.circular(50)),
            child: CircleAvatar(
              radius: 8,
              backgroundColor: color,
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address),
              const SizedBox(height: 5),
              Text(phNumber),
            ],
          ),
          trailing: const Icon(Icons.delete, color: redColor).onTap(
            () {
              FirebaseFirestore.instance
                  .collection('add_delivery_address')
                  .doc(docId)
                  .delete();
            },
          ),
        ),
        const Divider(
          height: 30,
        ),
      ],
    );
  }
}
