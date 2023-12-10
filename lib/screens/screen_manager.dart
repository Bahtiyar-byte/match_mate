import 'package:flutter/material.dart';
import 'package:match_mate/screens/persons/find_persons_mates_screen.dart';
import '../datastore/data_person.dart';
import 'common/chat_screen.dart';
import 'common/login_screen.dart';
import 'interests/tips_screen.dart';
import 'interests/hobbies_screen.dart';
import 'interests/person_tips_screen.dart';
import 'interests/person_hobbies_screen.dart';
import 'common/major_screen.dart';
import 'common/splash_screen.dart';

import 'package:match_mate/datastore/data_tip.dart';

class ScreenManager {

  static void openSpalashScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }


  static void openChatScreen(BuildContext context, Person? person) {
    if (person == null) {

      Navigator.pop(context);
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ChatScreen(person: person)),
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

  static void openHobbiesScreen(BuildContext context, Tip tip, bool returnToPersonHobbies) {
  Navigator.of(context).push(
  MaterialPageRoute(builder: (context) => HobbiesScreen(tip: tip, returnToPersonHobbies: returnToPersonHobbies)),
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
