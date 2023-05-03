import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(title: const Text("Notifications")),
        body: Container(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: lightGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      './assets/images/deliveryBoy.png',
                    ).box.padding(const EdgeInsets.all(15)).make(),
                    const SizedBox(
                      width: 270,
                      child: Text(
                        "Your order has been delivered successfully",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ).box.outerShadowXl.make(),
            ],
          ),
        ),
      ),
    );
  }
}
