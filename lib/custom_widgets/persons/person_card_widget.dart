import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_person.dart';
import 'package:match_mate/datastore/data_context.dart';
import 'package:match_mate/screens/screen_manager.dart';
import 'package:provider/provider.dart';
import '_persons_interests_hobbies_expand_widget.dart';

class PersonCardWidget extends StatelessWidget {
  final Person? selectedPerson;

  PersonCardWidget({this.selectedPerson});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dataContext = Provider.of<DataContext>(context);
    final person = selectedPerson ?? dataContext.persons.first;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: theme.colorScheme.background,
          elevation: 45,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage(person.imageAsset()),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(person.nickname, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
                          SizedBox(height: 8),
                          Text(person.description, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300, fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.chat, size: 50, color: Colors.blueAccent),
                        onPressed: () {
                          ScreenManager.openChatScreen(context, person);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ExpansionTile(
                  title: Text('Interests & Hobbies', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
                  children: person.subscribedTips.map((tip) => PersonTipHobbiesExpandWidget(tip, theme)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
