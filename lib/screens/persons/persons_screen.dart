import 'package:flutter/material.dart';
import 'package:match_mate/custom_widgets/persons/vertical_persons_list_widget.dart';
import 'package:match_mate/datastore/data_context.dart';
import 'package:match_mate/custom_widgets/menu/custom_app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:match_mate/screens/common/major_screen.dart';

class PersonsScreen extends StatefulWidget {
  @override
  _PersonsScreenState createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen> {
  late DataContext dataContext;
  bool _isSearchVisible = false;

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
          VerticalPersonsListWidget(peopleList: dataContext.persons),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MajorScreen()),
                );
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
                'Back',
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
