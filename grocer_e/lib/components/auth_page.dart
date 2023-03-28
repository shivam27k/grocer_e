import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/views/auth_GrocerE/onboarding_screen/onboarding_screen.dart';
import 'package:grocer_e/views/navigation_GrocerE/navigation_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const NavScreen();
          } else {
            return const OnboardingScreen();
          }
        },
      ),
    );
  }
}
