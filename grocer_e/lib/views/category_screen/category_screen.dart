import 'package:grocer_e/components/common_app_bar.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/views/category_screen/categories/categories.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final categoriesTitle = [
    "Vegetables",
    "Fruits",
    "Atta",
    "Rice",
    "Pulses",
    "Spices(Masala)",
    "Sugar and Salt",
    "Dry Fruits and Nuts",
    "Oil and Ghee",
    "Noodles Pastas",
    "Canned Foods(Packaged Foods)",
    "Snacks",
    "Home Decor",
    "Home Essentials",
    "Kitchen Essentials",
    "Toiletries",
    "Detergents(Laundry)",
    "Women's Hygiene",
    "Baby Care",
    "Skin Care",
    "Hair Care",
    "Body Care",
    "Beverages",
    "Oral Care",
    "House Cleaning",
    "Spiritual Items",
  ];

  navigateCategory(categoryTitle) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Categories(
            title: categoryTitle,
          );
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          var tween =
              Tween(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
                  .chain(CurveTween(curve: Curves.ease));
          return Align(
            child: SlideTransition(
              position: animation.drive(tween),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
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
              const CommonAppBar(),
              20.heightBox,
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Text(
                  "Categories",
                  style: TextStyle(
                    color: blueColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              20.heightBox,
              Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(
                    bottom: 251.8, top: 5, left: 20, right: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 26,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 180,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          shopImage1,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          categoriesTitle[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: whiteColor,
                            overflow: TextOverflow.visible,
                          ),
                        ).flexible(),
                      ],
                    )
                        .box
                        .color(blueColor)
                        .shadow
                        .roundedSM
                        .padding(const EdgeInsets.all(10))
                        .make()
                        .onTap(() {
                      navigateCategory(categoriesTitle[index]);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
