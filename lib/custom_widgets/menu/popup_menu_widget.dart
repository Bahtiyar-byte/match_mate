import 'package:flutter/material.dart';

class PopupMenuWidget extends StatelessWidget {
  final void Function(String) onMenuItemSelected;

  const PopupMenuWidget({required this.onMenuItemSelected});

  @override
  Widget build(BuildContext context) {
    Color menuBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return PopupMenuButton<String>(
      icon: Container(
        padding: EdgeInsets.all(4),
        child: Image.asset('assets/images/menuB.png', width: 48, height: 48),
      ),
      color: menuBackgroundColor,
      itemBuilder: (context) => [
        const PopupMenuItem(
          child: Text('My hobbies'),
          value: 'MyHobbies',
        ),
        PopupMenuItem(
          child: Text('Find mates'),
          value: 'FindMates',
        ),
        PopupMenuItem(
          child: Text('Matched mates'),
          value: 'MatchedMates',
        ),
        PopupMenuItem(
          child: Text('Log Out'),
          value: 'Logout',
        ),
      ],
      onSelected: onMenuItemSelected,
    );
  }
}

