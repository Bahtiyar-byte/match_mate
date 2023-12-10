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
          : Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: selectedPerson == null ? 1.0 : 0.1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/splash_screen_final.png"),
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Text('Select a person to see details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Choose a color that contrasts well with your image
              )),
        ],
      ),
    );
  }
}


/*
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
*/