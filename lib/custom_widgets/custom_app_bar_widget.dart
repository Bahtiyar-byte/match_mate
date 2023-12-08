import 'package:flutter/material.dart';
import 'package:match_mate/custom_widgets/popup_menu_widget.dart';
import 'package:match_mate/custom_widgets/menu_actions_handler.dart';

class CustomAppBar extends StatelessWidget {
  final bool isSearchVisible;
  final ValueChanged<bool> onSearchToggle;

  CustomAppBar({required this.isSearchVisible, required this.onSearchToggle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: theme.colorScheme.background,
          title: Text('Match Mate', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
          centerTitle: true,
          leading: PopupMenuWidget(
          onMenuItemSelected: (value) => MenuActionsHandler.handleMenuItemSelected(context, value),
        ),

          actions: [
            InkWell(
              onTap: () {
                onSearchToggle(!isSearchVisible);
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset('assets/images/findB.png', width: 32, height: 32),
                ),
              ),
            ),
          ],
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: isSearchVisible ? 50 : 0,
          child: Visibility(
            visible: isSearchVisible,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/search_icon.png'),
                    onPressed: () {
                      onSearchToggle(false);
                      // Добавьте ваш код для выполнения поиска здесь
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
