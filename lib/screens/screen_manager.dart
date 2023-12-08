import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'tips_screen.dart';
import 'hobbies_screen.dart';
import 'person_tips_screen.dart';
import 'person_hobbies_screen.dart';
import 'major_screen.dart';
import 'splash_screen.dart';
import 'persons_screen.dart';
import 'package:match_mate/datastore/data_tip.dart';

class ScreenManager {

  static void openSpalashScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }


  static void openPersonsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PersonsScreen()),
    );
  }

  // Метод для перехода на экран входа
  static void openLoginScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => LoginScreen()),

    );
  }

  // Метод для перехода на экран советов
  static void openTipsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TipsScreen()),
    );
  }

  static void openPersonTipsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PersonTipsScreen()),
    );
  }

  // Метод для перехода на экран увлечений
  static void openHobbiesScreen(BuildContext context, Tip tip) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => HobbiesScreen(tip: tip)),
    );
  }

  static void openPersonHobbiesScreen(BuildContext context, Tip tip) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PersonHobbiesScreen(tip: tip)),
    );
  }

  // Метод для перехода на экран Major
  static void openMajorScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MajorScreen()),
    );
  }


}
