import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_person.dart';
import 'package:match_mate/datastore/data_context.dart';
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
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Person card', style: theme.textTheme.headline6?.copyWith(color: theme.textTheme.bodyLarge?.color)),
                SizedBox(height: 8),
                Image.asset(person.imageAsset(), fit: BoxFit.cover),
                SizedBox(height: 8),
                Text(person.name, style: theme.textTheme.headline6?.copyWith(color: theme.textTheme.bodyLarge?.color)),
                SizedBox(height: 8),
                Text(person.description, style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
                SizedBox(height: 8),
                ExpansionTile(
                  title: Text('Tips & Hobbies : ', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
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
