import 'package:grocer_e/components/auth_page.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/components/bg_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  void signUserOut() {
    BuildContext? context = _key.currentContext;
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context!,
      MaterialPageRoute(
        builder: (context) => const AuthPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        key: _key,
        body: Center(
          child: TextButton(
            onPressed: signUserOut,
            child: const Text('Log Out'),
          ),
        ),
      ),
    );
  }
}
