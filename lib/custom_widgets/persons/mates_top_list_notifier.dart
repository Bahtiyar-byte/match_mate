

import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_person.dart';

class MatesTopListNotifier extends ChangeNotifier {
  Person? _selectedPerson;

  Person? get selectedPerson => _selectedPerson;

  void selectPerson(Person person) {
    if (_selectedPerson != person) {
      _selectedPerson = person;
      notifyListeners();
    }
  }
}

