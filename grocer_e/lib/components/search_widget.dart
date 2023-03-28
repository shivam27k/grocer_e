import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/views/search_screen/search_screen.dart';

Widget searchWidget(BuildContext context) {
  // using velocity X here
  return GestureDetector(
    onTap: () => {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        ),
      )
    },
    child: Container(
      height: 60,
      width: (context.screenWidth * 0.85),
      alignment: Alignment.center,
      child: TextFormField(
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderWhiteColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: blueColor,
            ),
          ),
          suffixIcon: Icon(Icons.search, color: blueColor),
          filled: true,
          fillColor: whiteColor,
          hintText: "Search for any store/product",
          hintStyle: TextStyle(color: lightGrey),
          contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
        ),
      ),
    ),
  );
}
