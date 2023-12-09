import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_person.dart';
import 'package:match_mate/datastore/data_tip.dart';

Widget PersonTipHobbiesExpandWidget(Tip tip, ThemeData theme) {
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