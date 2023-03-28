import 'package:get/get.dart';
import 'package:grocer_e/views/auth_GrocerE/splash_screen/splash_screen.dart';
import './consts/consts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(backgroundColor: blueColor),
        fontFamily: regular,
        iconTheme: const IconThemeData(color: lightGrey),
        
      ),
      // home: LoginScreen(),
      home: const SplashScreen(),
    );
  }
}
