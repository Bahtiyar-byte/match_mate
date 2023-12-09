import 'package:flutter/material.dart';
import 'package:match_mate/custom_widgets/interests/hobbies_list_widget.dart';
import 'package:match_mate/screens/interests/person_tips_screen.dart';
import 'package:match_mate/screens/common/major_screen.dart';
import 'package:match_mate/datastore/data_context.dart';
import 'package:match_mate/datastore/data_tip.dart';
import 'package:match_mate/datastore/data_hobby.dart';
import 'package:provider/provider.dart';
import 'package:match_mate/custom_widgets/menu/custom_app_bar_widget.dart';
import 'package:match_mate/screens/screen_manager.dart';

class PersonHobbiesScreen extends StatefulWidget {
  final Tip tip;

  PersonHobbiesScreen({required this.tip});

  @override
  _PesronHobbiesScreenState createState() => _PesronHobbiesScreenState();
}

class _PesronHobbiesScreenState extends State<PersonHobbiesScreen> {
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
        title: Text('Selected hobbies:', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ScreenManager.openPersonTipsScreen(context);
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {

                    Tip? t = dataContext.getTip(widget.tip);
                    if (t !=null) {
                      ScreenManager.openHobbiesScreen(context, t, true);
                    }
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
                    'Add new',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
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
