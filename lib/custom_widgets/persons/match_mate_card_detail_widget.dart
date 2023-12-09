import 'package:flutter/material.dart';
import 'package:match_mate/custom_widgets/persons/person_card_widget.dart';
import 'package:match_mate/datastore/data_person.dart';

class MatchMateCardDetailWidget extends StatelessWidget {
  final List<Person> peopleList;
  final Person? selectedPerson;

  MatchMateCardDetailWidget({required this.peopleList, this.selectedPerson});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: selectedPerson != null
          ? SingleChildScrollView(
        child: PersonCardWidget(selectedPerson: selectedPerson!),
      )
          : Center(
        // Здесь может быть другой виджет или текст, если selectedPerson равен null
        child: Text('Select a person to see details'),
      ),
    );
  }
}
