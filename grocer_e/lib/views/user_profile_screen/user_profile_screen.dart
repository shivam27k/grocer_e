import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:grocer_e/components/auth_page.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/services/firestore_services.dart';
import 'package:grocer_e/views/user_profile_screen/about_us_screen/about_us_screen.dart';
// import 'package:grocer_e/views/user_profile_screen/contact_us_screen/contact_us_screen.dart';
import 'package:grocer_e/views/user_profile_screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:grocer_e/views/user_profile_screen/edit_profile_screen/profile_controller.dart';
import 'package:grocer_e/views/user_profile_screen/favorites_screen/favorites_screen.dart';
import 'package:grocer_e/views/user_profile_screen/orders_screen/orders_screen.dart';
import 'package:grocer_e/views/user_profile_screen/saved_address_screen/saved_address_screen.dart';
import 'package:grocer_e/views/user_profile_screen/terms_and_condition_screen/terms_and_condition_screen.dart';
// import 'components/details_card.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  var controller = Get.put(ProfileController());

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    BuildContext? context = _key.currentContext;
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context!,
      MaterialPageRoute(
        builder: (context) => const AuthPage(),
      ),
    );
  }

  final icons = const [
    Icon(Icons.list_alt, size: 22),
    Icon(Icons.favorite, size: 22),
    Icon(Icons.place, size: 22),
  ];
  final about = const [
    Icon(Icons.description, size: 22),
    Icon(Icons.mail, size: 22),
    Icon(Icons.gavel, size: 22),
  ];
  final iconsText = const ["Orders", "Favorites", "Saved Address"];
  final aboutText = const ["About Us", "Contact Us", "Terms and Conditions"];

  void editProfile(data) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return EditProfileScreen(
            data: data,
          );
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: SlideTransition(
              position: Tween(
                      begin: const Offset(1.0, 0.0),
                      end: const Offset(0.0, 0.0))
                  .animate(animation),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  aboutUsScreen() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const AboutUsScreen();
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: SlideTransition(
              position: Tween(
                      begin: const Offset(1.0, 0.0),
                      end: const Offset(0.0, 0.0))
                  .animate(animation),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  contactUsScreen() async {
    Uri url = Uri.parse(
        'mailto:contactus@grocere.com?subject=Subject&body=State%20your%20problems!%20or%20say%20Hi');
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  termsAndCondition() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const TermsAndCondition();
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: SlideTransition(
              position: Tween(
                      begin: const Offset(1.0, 0.0),
                      end: const Offset(0.0, 0.0))
                  .animate(animation),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  ordersScreen() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const OrdersScreen();
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: SlideTransition(
              position: Tween(
                      begin: const Offset(1.0, 0.0),
                      end: const Offset(0.0, 0.0))
                  .animate(animation),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  favoritesScreen() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const FavoritesScreen();
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: SlideTransition(
              position: Tween(
                      begin: const Offset(1.0, 0.0),
                      end: const Offset(0.0, 0.0))
                  .animate(animation),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  savedAddressScreen() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const SavedAddressScreen();
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: SlideTransition(
              position: Tween(
                      begin: const Offset(1.0, 0.0),
                      end: const Offset(0.0, 0.0))
                  .animate(animation),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        key: _key,
        body: StreamBuilder(
          stream: FireStoreServices.getUser(user.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(logoTextColor),
              ));
            } else {
              var data = snapshot.data!.docs[0];

              return SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    // color: redColor,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(0, 7),
                                  color: blackColor,
                                  spreadRadius: -9,
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: const Icon(Icons.edit, color: whiteColor),
                          ),
                        ).onTap(
                          () {
                            controller.nameController.text = data['name'];
                            editProfile(data);
                          },
                        ),
                        Row(
                          children: [
                            data['imageUrl'] == ''
                                ? Image.asset(
                                    defaultUser,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make()
                                : Image.network(
                                    data['imageUrl'],
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                            7.widthBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data['name']}".allWordsCapitilize(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: regular,
                                      color: blackColor,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  Text(
                                    "${data['email']}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: regular,
                                      color: darkFontGrey,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: redColor,
                                ),
                              ),
                              onPressed: () {
                                signUserOut();
                              },
                              child: "Log Out".text.color(redColor).make(),
                            )
                          ],
                        ),
                        20.heightBox,
                        const Divider(),
                        30.heightBox,
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     detailsCard(
                        //       width: (context.screenWidth / 4.2),
                        //       count: data['cart_count'],
                        //       title: "in your cart",
                        //     ),
                        //     detailsCard(
                        //       width: (context.screenWidth / 4.2),
                        //       count: data['favorites_count'],
                        //       title: "favorite shops",
                        //     ),
                        //     detailsCard(
                        //       width: (context.screenWidth / 4.2),
                        //       count: data['orders_count'],
                        //       title: "orders",
                        //     ),
                        //   ],
                        // ),
                        // 50.heightBox,
                        ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const Divider(color: lightGrey);
                          },
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: icons[index],
                              onTap: () => {
                                if (iconsText[index] == iconsText[0])
                                  {
                                    ordersScreen(),
                                  }
                                else if (iconsText[index] == iconsText[1])
                                  {
                                    favoritesScreen(),
                                  }
                                else if (iconsText[index] == iconsText[2])
                                  {
                                    savedAddressScreen(),
                                  }
                              },
                              title: Text(
                                iconsText[index],
                                style: const TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                ),
                              ),
                              minLeadingWidth: 10,
                              contentPadding: const EdgeInsets.only(left: 25),
                            );
                          },
                        ).box.white.roundedSM.shadowSm.make(),
                        20.heightBox,
                        ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const Divider(color: lightGrey);
                          },
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: about[index],
                              onTap: () => {
                                if (aboutText[index] == aboutText[0])
                                  {
                                    aboutUsScreen(),
                                  }
                                else if (aboutText[index] == aboutText[1])
                                  {
                                    contactUsScreen(),
                                  }
                                else if (aboutText[index] == aboutText[2])
                                  {
                                    termsAndCondition(),
                                  }
                              },
                              title: Text(
                                aboutText[index],
                                style: const TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                ),
                              ),
                              minLeadingWidth: 10,
                              contentPadding: const EdgeInsets.only(left: 25),
                            );
                          },
                        ).box.white.roundedSM.shadowSm.make(),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
