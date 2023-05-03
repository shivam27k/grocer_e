import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/views/cart_screen/cart_screen.dart';
import 'package:grocer_e/views/home_screen/home_screen.dart';
// import 'package:grocer_e/views/category_screen/category_screen.dart';
import 'package:grocer_e/views/user_profile_screen/user_profile_screen.dart';
import 'package:flutter/services.dart';

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
    // Icon(
    //   Icons.category,
    //   size: 25,
    // ),
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
      // case 1:
      //   widget = const CategoryScreen();
      //   break;
      case 1:
        widget = const CartScreen();
        break;
      case 2:
        widget = const UserProfileScreen();
        break;
      default:
        widget = const HomeScreen();
        break;
    }
    return widget;
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit an App?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Container(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 10),
                        color: blackColor,
                        spreadRadius: -9,
                      ),
                    ],
                  ),
                  child: const Text(
                    'No',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Container(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 10),
                        color: blackColor,
                        spreadRadius: -9,
                      ),
                    ],
                  ),
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false; 
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
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
      ),
    );
  }
}
