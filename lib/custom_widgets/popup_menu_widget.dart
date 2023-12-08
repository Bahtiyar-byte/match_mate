import 'package:flutter/material.dart';

class PopupMenuWidget extends StatelessWidget {
  final void Function(String) onMenuItemSelected;

  PopupMenuWidget({required this.onMenuItemSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Container(
        padding: EdgeInsets.all(4),
        child: Image.asset('assets/images/menuB.png', width: 48, height: 48),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text('My hobbies'),
          value: 'My hobbies', // Обновите значение здесь
        ),
        PopupMenuItem(
          child: Text('Cabinet'),
          value: 'cabinet',
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
