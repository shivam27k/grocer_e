import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/components/bg_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add to your cart"),
          centerTitle: true,
          backgroundColor: blueColor,
          automaticallyImplyLeading: false,
        ),
        body: const Center(
          child: Text('Cart Screen'),
        ),
      ),
    );
  }
}
