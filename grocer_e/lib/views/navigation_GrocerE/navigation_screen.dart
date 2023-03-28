import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/views/cart_screen/cart_screen.dart';
import 'package:grocer_e/views/home_screen/home_screen.dart';
import 'package:grocer_e/views/category_screen/category_screen.dart';
import 'package:grocer_e/views/user_profile_screen/user_profile_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final items = const [
    Icon(
      Icons.home,
      size: 25,
    ),
    Icon(
      Icons.category,
      size: 25,
    ),
    Icon(
      Icons.shopping_cart,
      size: 25,
    ),
    Icon(
      Icons.people,
      size: 25,
    ),
  ];

  int index = 0;

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const HomeScreen();
        break;
      case 1:
        widget = const CategoryScreen();
        break;
      case 2:
        widget = const CartScreen();
        break;
      case 3:
        widget = const UserProfileScreen();
        break;
      default:
        widget = const HomeScreen();
        break;
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: appBgColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        animationCurve: Curves.decelerate,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: darkFontGrey,
        color: blueColor,
        onTap: (selectedIndex) {
          setState(
            () {
              index = selectedIndex;
            },
          );
        },
        height: 70,
        animationDuration: const Duration(milliseconds: 290),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: getSelectedWidget(index: index),
      ),
    );
  }
}
