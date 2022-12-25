import 'package:engage/controller/auth_controller.dart';
import 'package:engage/view/screens/auth/engageLogin.dart';
import 'package:engage/view/screens/auth/engageRegister.dart';
import 'package:engage/view/screens/engageSplashScreen.dart';
import 'package:engage/view/screens/engageUserProfile.dart';
import 'package:engage/view/screens/home.dart';
import 'package:engage/view/utils/routes.dart';
import 'package:engage/view/utils/theme.dart';
import 'package:engage/view/widgets/engageProfile/profileEdit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    const SplashScreen();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Engage SoftTunners',
      theme: engageTheme,
      // getPages: engageRoutes(),
      routes: {
        EngageRoutes.redirect: (context) => const SplashScreen(),
        EngageRoutes.home: (context) => HomeScreen(),
        EngageRoutes.login: (context) => const EngageLogin(),
        EngageRoutes.register: (context) => const EngageRegister(),
        // EngageRoutes.userEdit: (context) => const EngageProfileEdit(),
      },
      initialRoute: '/',
    );
  }
}
