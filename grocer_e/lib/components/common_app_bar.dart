import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/components/bg_widget.dart';

import '../../components/search_widget.dart';
import '../views/notification_screen/notification_screen.dart';

class CommonAppBar extends StatefulWidget {
  const CommonAppBar({
    super.key,

    // required this.obscureText,
  });

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  notificationScreen() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const NotificationScreen();
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
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 20, right: 24, bottom: 14, left: 24),
                child: SafeArea(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        searchWidget(context),
                        (context.screenWidth * 0.32).widthBox,
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        (context.screenWidth * 0.04).widthBox,
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: IconButton(
                            onPressed: () {
                              notificationScreen();
                            },
                            icon: const Icon(
                              Icons.notifications,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
