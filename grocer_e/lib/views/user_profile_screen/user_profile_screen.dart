import 'package:grocer_e/components/auth_page.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/views/notification_screen/notification_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final user = FirebaseAuth.instance.currentUser!;

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

  notificationScreen() {
    BuildContext? context = _key.currentContext;
    // FirebaseAuth.instance.signOut();
    Navigator.push(
      context!,
      MaterialPageRoute(
        builder: (context) => const NotificationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          // centerTitle: true,
          backgroundColor: blueColor,
          automaticallyImplyLeading: false,
          toolbarHeight: (context.screenHeight * 0.07),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  notificationScreen();
                },
                icon: const Icon(Icons.notifications))
          ],
        ),
        key: _key,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You're logged in as ${user.email}"),
              TextButton(
                onPressed: signUserOut,
                child: const Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
