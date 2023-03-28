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
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Category"),
          centerTitle: true,
          backgroundColor: blueColor,
          automaticallyImplyLeading: false,
        ),
        body: const Center(
          child: Text('Category Screen'),
        ),
      ),
    );
  }
}
