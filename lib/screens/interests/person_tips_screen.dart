import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_tip.dart';
import 'package:match_mate/custom_widgets/interests/tips_list_widget.dart';
import 'package:match_mate/datastore/data_context.dart';
import 'package:provider/provider.dart';
import 'package:match_mate/screens/common/major_screen.dart';
import 'package:match_mate/screens/screen_manager.dart';

class PersonTipsScreen extends StatefulWidget {
  @override
  _PersonTipsScreenState createState() => _PersonTipsScreenState();
}

class _PersonTipsScreenState extends State<PersonTipsScreen> {
  late DataContext dataContext;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dataContext = Provider.of<DataContext>(context);
  }

  bool _isSearchVisible = false;

  void _handleTipSelected(Tip tip) {
    ScreenManager.openPersonHobbiesScreen(context, tip);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Column(
        children: [
          Container(height: 1, color: theme.dividerColor, margin: EdgeInsets.symmetric(vertical: 8)),
          TipsListWidget(
            tips: dataContext.user?.subscribedTips ?? [],
            onTipSelected: _handleTipSelected,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ScreenManager.openMajorScreen(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: theme.hintColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    minimumSize: Size(150, 0),
                  ),
                  child: Text(
                    'Back',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ScreenManager.openTipsScreen(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: theme.hintColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    minimumSize: Size(150, 0),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
