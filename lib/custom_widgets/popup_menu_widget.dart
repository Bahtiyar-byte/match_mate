import 'package:flutter/material.dart';

class PopupMenuWidget extends StatelessWidget {
  final void Function(String) onMenuItemSelected;

  PopupMenuWidget({required this.onMenuItemSelected});

  @override
  Widget build(BuildContext context) {
    // Здесь мы используем Theme.of(context).scaffoldBackgroundColor,
    // чтобы цвет фона меню соответствовал фону Scaffold
    Color menuBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return PopupMenuButton<String>(
      icon: Container(
        padding: EdgeInsets.all(4),
        child: Image.asset('assets/images/menuB.png', width: 48, height: 48),
      ),
      color: menuBackgroundColor, // Установка цвета фона меню
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text('My hobbies'),
          value: 'MyHobbies',
        ),
        PopupMenuItem(
          child: Text('Find mates'),
          value: 'FindMates',
        ),
        PopupMenuItem(
          child: Text('Settings'),
          value: 'settings',
        ),
        PopupMenuItem(
          child: Text('Log Out'),
          value: 'logout',
        ),
      ],
      onSelected: onMenuItemSelected,
    );
  }
}

