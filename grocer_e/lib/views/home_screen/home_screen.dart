import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/views/home_screen/tabs/retail_tab/retail_tab.dart';
import 'package:grocer_e/views/home_screen/tabs/wholesale_tab/wholesale_tab.dart';

import '../../components/common_app_bar.dart';
// import '../../components/search_widget.dart';
// import '../notification_screen/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const CommonAppBar(),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(
                  bottom: 187,
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
                          indicator: const BoxDecoration(
                            // borderRadius: BorderRadius.circular(10),
                            border: Border(
                                bottom: BorderSide(
                              width: 1.5,
                              color: blueColor,
                            )),
                          ),
                          tabs: [
                            Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              child: const Text(
                                "Retail",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              child: const Text(
                                "Wholesale",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Expanded(
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              RetailTab(),
                              WholesaleTab(),
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
