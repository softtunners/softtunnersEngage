// Main Routes

// Bottom Navigation
import 'package:engage/view/screens/auth/engageLogin.dart';
import 'package:engage/view/screens/auth/engageRegister.dart';
import 'package:engage/view/screens/engageHome.dart';
import 'package:engage/view/screens/engageNotify.dart';
import 'package:engage/view/screens/engageProfile.dart';
import 'package:engage/view/screens/engageSplashScreen.dart';
import 'package:engage/view/screens/engageUpload.dart';
import 'package:engage/view/screens/engageUsers.dart';
import 'package:engage/view/widgets/engageProfile/profileEdit.dart';
import 'package:get/get.dart';

class EngageRoutes {
  static String home = "home";
  static String login = "login";
  static String splash = "splash";
  static String userEdit = "usereditprofile";
  static String register = "register";
  static String userProfile = "usersprofile";
  static String redirect = "/";

  static String getHome() => home;

  static List<GetPage> routes = [
    GetPage(
      name: redirect,
      page: () => EngageHome(),
      transition: Transition.circularReveal,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: home,
      page: () => EngageHome(),
      transition: Transition.circularReveal,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: login,
      page: () => EngageLogin(),
      transition: Transition.circularReveal,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.circularReveal,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: userEdit,
      page: () => EngageProfileEdit(),
      transition: Transition.circularReveal,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: register,
      page: () => EngageRegister(),
      transition: Transition.circularReveal,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: userProfile,
      page: () => EngageProfile(),
      transition: Transition.circularReveal,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}

var pageindex = [EngageHome(), EngageUsers(), const EngageUpload(), EngageNotify(), EngageProfile()];
