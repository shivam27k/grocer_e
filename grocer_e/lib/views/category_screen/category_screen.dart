import 'package:grocer_e/components/common_app_bar.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/components/bg_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CommonAppBar(),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(
                  bottom: (context.screenHeight * 0.21),
                  top: 5,
                ),
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    body: Column(
                      children: [
                        TabBar(
                          labelColor: blueColor,
                          unselectedLabelColor: fontGrey,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                          ),
                          tabs: const [
                            Text(
                              "Retail",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Wholesale",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topCenter,
                                      child: const Text("1st Category"),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topCenter,
                                      child: const Text("2nd Category"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
