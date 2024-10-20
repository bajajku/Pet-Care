import 'package:flutter/material.dart';
import '../models/pet.dart';

class PetProvider with ChangeNotifier {
  List<Pet> _pets = [];

  List<Pet> get pets => _pets;

  void addPet(Pet pet) {
    _pets.add(pet);

    //Call this method whenever the object changes, to notify any clients the object may have changed.
    notifyListeners();

  }

  void removePet(String id) {
    _pets.removeWhere((pet) => pet.id == id);
    notifyListeners();
  }
}
