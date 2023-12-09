import 'package:flutter/material.dart';
import 'package:match_mate/custom_widgets/menu/match_app_bar_widget.dart';
import 'package:match_mate/custom_widgets/persons/person_card_widget.dart';
import 'package:match_mate/custom_widgets/persons/mates_top_list_notifier.dart';
import 'package:match_mate/screens/screen_manager.dart';
import 'package:provider/provider.dart';
import 'package:match_mate/datastore/data_context.dart';

class MajorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MatesTopListNotifier(),
      child: _MajorScreenBody(),
    );
  }
}

class _MajorScreenBody extends StatefulWidget {
  @override
  _MajorScreenState createState() => _MajorScreenState();
}

class _MajorScreenState extends State<_MajorScreenBody> {
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
      body: SafeArea(
        child: Column(
          children: [
            MatchAppBar(
              isSearchVisible: _isSearchVisible,
              onSearchToggle: (isVisible) {
                setState(() {
                  _isSearchVisible = isVisible;
                });
              },
            ),
            Container(height: 1, color: theme.dividerColor, margin: EdgeInsets.symmetric(vertical: 8)),
            Expanded(
              child: Consumer<MatesTopListNotifier>(
                builder: (context, storyNotifier, child) {
                  return SingleChildScrollView(
                    child: storyNotifier.selectedPerson != null
                        ? PersonCardWidget(selectedPerson: storyNotifier.selectedPerson)
                        : Center(child: Text('Select a person to see details')),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
              child: ElevatedButton(
                onPressed: () {
                  ScreenManager.openPersonsScreen(context);
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
                  'Find mates',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
