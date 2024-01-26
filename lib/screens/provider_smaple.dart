import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sample/models/pet.dart';

class MainProvider with ChangeNotifier {
  late Pet _myPet;
  MainProvider() {
    _myPet = Pet("", Random().nextInt(7) + 1, Random().nextInt(11) + 6);
  }

  Pet get pet => _myPet;
  int get age => _myPet.age;
  int get weight => _myPet.weight;
  String get name => _myPet.name;

  addAge() {
    _myPet.age += 1;
    _endProcess();
  }

  subAge() {
    _myPet.age -= 1;
    _endProcess();
  }

  addWeight() {
    _myPet.weight += 1;
    _endProcess();
  }

  subWeight() {
    _myPet.weight -= 1;
    _endProcess();
  }

  addName(String newName) {
    _myPet.name = newName;
    _endProcess();
  }

  _endProcess() {
    notifyListeners();
  }
}
