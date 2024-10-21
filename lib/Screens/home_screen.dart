import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pet_provider.dart';
import '../widgets/pet_card.dart';
import 'add_pet_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final petProvider = Provider.of<PetProvider>(context);
    return Scaffold(
      body: petProvider.pets.isEmpty
          ? Center(child: Text('No pets added yet.'))
          : ListView.builder(
        itemCount: petProvider.pets.length,
        itemBuilder: (ctx, index) => PetCard(petProvider.pets[index]),
      ),
    );
  }
}
