import 'package:flutter/material.dart';
import 'package:match_mate/screens/screen_manager.dart';

class MenuActionsHandler {
  static void handleMenuItemSelected(BuildContext context, String value) {
    // Обработка выбора пункта меню
    if (value == 'MyHobbies') {
      ScreenManager.openPersonTipsScreen(context);

    }
    else if (value == 'FindMates') {
      ScreenManager.openPersonsScreen(context);
    }


    else if (value == 'MatchedMates')
    {
      ScreenManager.openMajorScreen(context);
    }
    else if (value == 'Logout')
    {
      ScreenManager.openSpalashScreen(context);
    }
  }
}
