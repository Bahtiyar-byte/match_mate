import 'package:flutter/material.dart';
import 'package:match_mate/custom_widgets/person_card_widget.dart';
import 'package:match_mate/datastore/data_person.dart';


class CardsSwipeWidget extends StatelessWidget {
  final List<Person> peopleList;
  final Person? selectedPerson;

  CardsSwipeWidget({required this.peopleList, this.selectedPerson});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: selectedPerson != null
          ? PersonCardWidget(person: selectedPerson!)
          : Center(
        child: Text('Выберите персону из сторис'),
      ),
    );
  }
}