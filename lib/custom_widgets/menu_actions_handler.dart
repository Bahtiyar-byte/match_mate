import 'package:flutter/material.dart';
import 'package:match_mate/screens/person_tips_screen.dart'; // Импортируйте TipsScreen

class MenuActionsHandler {
  static void handleMenuItemSelected(BuildContext context, String value) {
    // Обработка выбора пункта меню
    if (value == 'My hobbies') {
      // Переход на экран TipsScreen
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonTipsScreen()));
    } else if (value == 'cabinet') {

    } else if (value == 'settings') {
      // Обработка "Settings"
    } else if (value == 'logout') {

    }
  }
}
