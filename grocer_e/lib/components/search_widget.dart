import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/views/search_screen/search_screen.dart';

Widget searchWidget(BuildContext context) {
  // using velocity X here
  return GestureDetector(
    onTap: () => {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return const SearchScreen();
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
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
      )
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.30,
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.search,
                color: whiteColor,
                size: 18,
              ),
              (context.screenWidth * 0.01).widthBox,
              const Text(
                "Search",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
