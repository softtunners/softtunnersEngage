// Main Routes

// Bottom Navigation
import 'package:engage/view/screens/engageHome.dart';
import 'package:engage/view/screens/engageNotify.dart';
import 'package:engage/view/screens/engageProfile.dart';
import 'package:engage/view/screens/engageUpload.dart';
import 'package:engage/view/screens/engageUsers.dart';
import 'package:engage/view/screens/home.dart';
import 'package:flutter/cupertino.dart';

class EngageRoutes {
  static String home = "home";
  static String login = "login";
  static String splash = "splash";
  static String userEdit = "usereditprofile";
  static String register = "register";
  static String userProfile = "usersprofile";
  static String redirect = "/";
}

var pageindex = [EngageHome(), EngageUsers(), EngageUpload(), EngageNotify(), EngageProfile()];
