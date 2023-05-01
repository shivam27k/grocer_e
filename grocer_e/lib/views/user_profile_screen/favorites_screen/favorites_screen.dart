// import 'package:get/get.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';
// import 'package:grocer_e/controllers/shop_controller.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(
      // ShopController(),
    // );

    return SafeArea(
      child: bgWidget(
        child: Scaffold(
          appBar: AppBar(
            title: "Your Favorite Shops".text.make(),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(),
          ),
        ),
      ),
    );
  }
}
