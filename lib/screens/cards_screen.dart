import 'package:flutter/material.dart';
import 'package:match_mate/custom_widgets/cards_swipe_widget.dart';
import 'package:match_mate/custom_widgets/popup_menu_widget.dart';
import 'package:match_mate/custom_widgets/mates_top_list_widget.dart';
import 'package:match_mate/screens/tips_screen.dart';
import 'package:match_mate/datastore/data_context.dart';
import 'package:provider/provider.dart';
import 'package:match_mate/custom_widgets/mates_top_list_notifier.dart';
import 'package:match_mate/custom_widgets/custom_app_bar_widget.dart';
import 'package:match_mate/custom_widgets/menu_actions_handler.dart';

class CardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MatesTopListNotifier(),
      child: _CardsScreenBody(),
    );
  }
}

class _CardsScreenBody extends StatefulWidget {
  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<_CardsScreenBody> {
  bool _isSearchVisible = false;
  late DataContext dataContext;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dataContext = Provider.of<DataContext>(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Column(
        children: [
          CustomAppBar(isSearchVisible: _isSearchVisible, onSearchToggle: (isVisible) {
            setState(() {
              _isSearchVisible = isVisible;
            });
          }),
          Container(height: 1, color: theme.dividerColor, margin: EdgeInsets.symmetric(vertical: 8)),
          MatesTopListWidget(people: dataContext.persons),
          Container(height: 1, color: theme.dividerColor, margin: EdgeInsets.symmetric(vertical: 8)),
          Expanded(child: CardsSwipeWidget(peopleList: dataContext.persons)),  // Изменение здесь
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
                  minimumSize: Size(145, 0),
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
                  // Обработчик нажатия кнопки Google
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).hintColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  minimumSize: Size(145, 0),
                ),
                child: Text(
                  'Google',
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
