import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_person.dart';
import 'package:match_mate/datastore/data_tip.dart';

import '_persons_interests_hobbies_expand_widget.dart';

class PersonLineWidget extends StatelessWidget {
  final Person person;

  PersonLineWidget({required this.person});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: theme.colorScheme.background,
        elevation: 15,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(person.name, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    Text(person.description, style: TextStyle(color: Colors.black87,)),
                    SizedBox(height: 8),

                    ExpansionTile(
                      title: Text('Interests & Hobbies: ', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
                      children: person.subscribedTips.map((tip) => PersonTipHobbiesExpandWidget(tip, theme)).toList(),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              title: Text('Notification'),
                              content: Text('Your Match Request to ${person.name} is sent! 🎉'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Send Match Request'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
