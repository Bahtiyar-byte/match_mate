

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

/*
import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_person.dart';

class StoryNotifier extends ChangeNotifier {
  Person? _selectedPerson;

  Person? get selectedPerson => _selectedPerson;

  void selectPerson(Person person) {
    if (_selectedPerson == person) {

      _selectedPerson = null;
      notifyListeners();

      Future.delayed(Duration.zero, () {
        _selectedPerson = person;
        notifyListeners();
      });
    } else {
      _selectedPerson = person;
      notifyListeners();
    }
  }
}*/