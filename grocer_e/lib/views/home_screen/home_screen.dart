import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/components/bg_widget.dart';

import '../../components/search_widget.dart';

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
        child: Container(
          padding: const EdgeInsets.all(14),
          width: context.screenWidth,
          height: context.screenHeight,
          child: SafeArea(
            child: Column(children: [
              searchWidget(context),
            ]),
          ),
        ),
      ),
    );
  }
}
