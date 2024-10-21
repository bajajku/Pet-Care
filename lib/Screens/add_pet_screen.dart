import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pet_provider.dart';
import '../models/pet.dart';

class AddPetScreen extends StatefulWidget {
  static const routeName = '/add-pet';

  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  DateTime? _birthDate;

  void _saveForm() {
    if (_formKey.currentState!.validate() && _birthDate != null) {
      final pet = Pet(
        id: DateTime.now().toString(),
        name: _nameController.text,
        breed: _breedController.text,
        birthDate: _birthDate!,
      );
      Provider.of<PetProvider>(context, listen: false).addPet(pet);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Pet Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _breedController,
                decoration: InputDecoration(labelText: 'Breed'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a breed.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  ).then((pickedDate) {
                    if (pickedDate != null) {
                      setState(() {
                        _birthDate = pickedDate;
                      });
                    }
                  });
                },
                child: Text(
                  _birthDate == null
                      ? 'Select Birth Date'
                      : 'Birth Date: ${_birthDate!.toLocal()}'.split(' ')[0],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text('Save Pet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
