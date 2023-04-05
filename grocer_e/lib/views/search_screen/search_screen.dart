import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';
// import 'package:grocer_e/views/navigation_GrocerE/navigation_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void moveBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              15.heightBox,
              Container(
                height: 60,
                padding: const EdgeInsets.only(
                    bottom: 5, top: 5, right: 23, left: 23),
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: borderWhiteColor,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: blueColor,
                      ),
                    ),
                    suffixIcon: const Icon(Icons.search, color: blueColor),
                    prefixIcon: GestureDetector(
                        onTap: moveBack,
                        child:
                            const Icon(Icons.chevron_left, color: blueColor)),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: "Search for any store/product",
                    hintStyle: const TextStyle(color: lightGrey),
                    contentPadding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
