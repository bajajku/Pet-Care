import 'package:flutter/material.dart';
import '../models/pet.dart';

class PetCard extends StatelessWidget {
  final Pet pet;

  const PetCard(this.pet, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(pet.name),
        subtitle: Text('${pet.breed} - Born on ${pet.birthDate.toLocal()}'.split(' ')[0]),
        trailing: const Icon(Icons.pets),
      ),
    );
  }
}
