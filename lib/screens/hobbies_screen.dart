import 'package:flutter/material.dart';

import 'package:match_mate/custom_widgets/hobbies_list_widget.dart';
import 'package:match_mate/screens/tips_screen.dart';
import 'package:match_mate/screens/major_screen.dart';
import 'package:match_mate/datastore/data_context.dart';
import 'package:match_mate/datastore/data_tip.dart';
import 'package:match_mate/datastore/data_hobby.dart';
import 'package:provider/provider.dart';
import 'package:match_mate/custom_widgets/custom_app_bar_widget.dart';

class HobbiesScreen extends StatefulWidget {
  final Tip tip;

  HobbiesScreen({required this.tip});

  @override
  _HobbiesScreenState createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen> {
  late DataContext dataContext;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dataContext = Provider.of<DataContext>(context);
  }

  bool _isSearchVisible = false;

  void _handleTipSelected(Hobby hobby) {
    // Обработка выбора Tip
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Column(
        children: [
          // Custom AppBar
          CustomAppBar(isSearchVisible: _isSearchVisible, onSearchToggle: (isVisible) { // <-- Использование CustomAppBar
            setState(() {
              _isSearchVisible = isVisible;
            });
          }),
          Container(height: 1, color: theme.dividerColor, margin: EdgeInsets.symmetric(vertical: 8)),
          HobbiesListWidget(hobbies: widget.tip.hobbies, onHobbySelected: _handleTipSelected),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TipsScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).hintColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  minimumSize: Size(150, 0),
                ),
                child: Text(
                  'Tips',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MajorScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).hintColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  minimumSize: Size(150, 0),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

