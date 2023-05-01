import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: "Orders".text.make(),
        ),
        body: const Text("Order Screen"),
      ),
    ));
  }
}
