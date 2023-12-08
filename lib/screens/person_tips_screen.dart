import 'package:flutter/material.dart';
import 'package:match_mate/custom_widgets/cards_swipe_widget.dart';
import 'package:match_mate/custom_widgets/popup_menu_widget.dart';
import 'package:match_mate/screens/major_screen.dart';
import 'package:match_mate/custom_widgets/story_widget.dart';
import 'package:match_mate/datastore/data_tip.dart';
import 'package:match_mate/custom_widgets/tips_list_widget.dart';
import 'package:match_mate/screens/hobbies_screen.dart';
import 'package:match_mate/datastore/data_context.dart';
import 'package:provider/provider.dart';
import 'package:match_mate/custom_widgets/custom_app_bar_widget.dart';

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
    // Обработка выбора Tip

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HobbiesScreen(tip: tip),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Column(
        children: [

          Container(height: 1, color: theme.dividerColor, margin: EdgeInsets.symmetric(vertical: 8)),
          TipsListWidget(tips: dataContext.tips, onTipSelected: _handleTipSelected), // Используйте TipsListWidget здесь
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
              padding: EdgeInsets.symmetric(vertical: 15),
              minimumSize: Size(double.infinity, 0),
            ),
            child: Text(
              'Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
