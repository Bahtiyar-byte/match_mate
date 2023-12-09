import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_person.dart';
import 'package:match_mate/datastore/data_tip.dart';

class PersonLineWidget extends StatelessWidget {
  final Person person;

  PersonLineWidget({required this.person});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: theme.colorScheme.background,
        elevation: 0,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(person.imageAsset(), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(person.name, style: theme.textTheme.headline6?.copyWith(color: theme.textTheme.bodyLarge?.color)),
                    SizedBox(height: 8),
                    Text(person.description, style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
                    SizedBox(height: 8),
                    ExpansionTile(
                      title: Text('Tips & Hobbies : ', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
                      children: person.subscribedTips.map((tip) => _buildTipHobbies(tip, theme)).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipHobbies(Tip tip, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                tip.imageSmallWidget(),
                SizedBox(width: 8.0),
                Text('${tip.name}:', style: theme.textTheme.subtitle1?.copyWith(color: Colors.black)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: tip.hobbies.map((hobby) => Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    hobby.imageSmallWidget(),
                    SizedBox(width: 8.0),
                    Text(hobby.name, style: theme.textTheme.bodyText2?.copyWith(color: Colors.black)),
                  ],
                ),
              )).toList(),
            ),
          ),
          Divider(color: Colors.grey, height: 32.0),
        ],
      ),
    );
  }
}
