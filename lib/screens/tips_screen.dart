import 'package:flutter/material.dart';
import 'package:match_mate/screens/screen_manager.dart';
import 'package:match_mate/datastore/data_tip.dart';
import 'package:match_mate/custom_widgets/tips_list_widget.dart';
import 'package:match_mate/datastore/data_context.dart';
import 'package:provider/provider.dart';
import 'package:match_mate/custom_widgets/custom_app_bar_widget.dart';

class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  late DataContext dataContext;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dataContext = Provider.of<DataContext>(context);
  }
  bool _isSearchVisible = false;

  void _handleTipSelected(Tip tip) {
    ScreenManager.openHobbiesScreen(context, tip);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Column(
        children: [
          CustomAppBar(isSearchVisible: _isSearchVisible, onSearchToggle: (isVisible) { // <-- Использование CustomAppBar
            setState(() {
              _isSearchVisible = isVisible;
            });
          }),
          Container(height: 1, color: theme.dividerColor, margin: EdgeInsets.symmetric(vertical: 8)),
          TipsListWidget(tips: dataContext.tips, onTipSelected: _handleTipSelected), // Используйте TipsListWidget здесь
          ElevatedButton(
            onPressed: () {
              ScreenManager.openMajorScreen(context);

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
              'Skip',
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
