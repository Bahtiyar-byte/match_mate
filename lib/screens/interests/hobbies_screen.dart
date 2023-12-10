import 'package:flutter/material.dart';
import 'package:match_mate/custom_widgets/interests/hobbies_list_widget.dart';
import 'package:match_mate/screens/interests/tips_screen.dart';
import 'package:match_mate/screens/common/major_screen.dart';
import 'package:match_mate/datastore/data_context.dart';
import 'package:match_mate/datastore/data_tip.dart';
import 'package:match_mate/datastore/data_hobby.dart';
import 'package:match_mate/screens/screen_manager.dart';
import 'package:provider/provider.dart';

class HobbiesScreen extends StatefulWidget {
  final Tip tip;
  final bool returnToPersonHobbies;

  HobbiesScreen({required this.tip, this.returnToPersonHobbies = false});

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

  void _handleTipSelected(Hobby hobby) {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.background,
        title: Text('What\'s your Hobby?', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
        centerTitle: true,
      ),
      backgroundColor: theme.colorScheme.background,
      body: Column(
        children: [

          Container(height: 1, color: theme.dividerColor, margin: EdgeInsets.symmetric(vertical: 8)),
          Expanded(
            child: HobbiesListWidget(hobbies: widget.tip.hobbies, onHobbySelected: _handleTipSelected),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
            child: ElevatedButton(
              onPressed: () {
                ScreenManager.openTipsScreen(context);
              },
              style: ElevatedButton.styleFrom(
                primary: theme.hintColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(double.infinity, 0),
              ),
              child: Text(
                'Interests',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
