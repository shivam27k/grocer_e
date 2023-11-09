import 'package:get/get.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/controllers/search_controller.dart'
    as search_controller;
import 'package:grocer_e/views/search_screen/search_result_screen.dart';
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
    var controller = Get.put(search_controller.SearchController());

    return bgWidget(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              15.heightBox,
              Container(
                height: 60,
                // margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.only(
                    bottom: 5, top: 5, right: 23, left: 23),
                alignment: Alignment.center,
                color: blueColor,
                child: TextField(
                  controller: controller.searchController,
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
                    suffixIcon:
                        const Icon(Icons.search, size: 30, color: blueColor)
                            .onTap(() {
                      if (controller
                          .searchController.text.isNotEmptyAndNotNull) {
                        Get.to(
                          () => SearchResultScreen(
                            title: controller.searchController.text,
                          ),
                        );
                      }
                    }),
                    prefixIcon: GestureDetector(
                        onTap: moveBack,
                        child:
                            const Icon(Icons.chevron_left, color: blueColor)),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: "Search for any product",
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
