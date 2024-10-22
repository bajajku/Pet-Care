import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Breed Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const PetBreedSelectionScreen(),
    );
  }
}

class PetBreedSelectionScreen extends StatefulWidget {
  const PetBreedSelectionScreen({super.key});

  @override
  State<PetBreedSelectionScreen> createState() => _PetBreedSelectionScreenState();
}

class _PetBreedSelectionScreenState extends State<PetBreedSelectionScreen> {
  String selectedAnimalType = 'Dog';

  // Define breeds for different animals
  final Map<String, List<Map<String, String>>> animalBreeds = {
    'Dog': [
      {'name': 'Golden Retriever', 'image': 'assets/dogs/golden_retriever.png'},
      {'name': 'Bulldog', 'image': 'assets/dogs/bulldog.png'},
      {'name': 'German Shepherd', 'image': 'assets/dogs/german_shepherd.png'},
      {'name': 'Poodle', 'image': 'assets/dogs/poodle.png'},
    ],
    'Cat': [
      {'name': 'Persian', 'image': 'assets/cats/persian.png'},
      {'name': 'Siamese', 'image': 'assets/cats/siamese.png'},
      {'name': 'Maine Coon', 'image': 'assets/cats/maine_coon.png'},
      {'name': 'British Shorthair', 'image': 'assets/cats/british_shorthair.png'},
    ],
    'Bird': [
      {'name': 'Budgie', 'image': 'assets/birds/budgie.png'},
      {'name': 'Cockatiel', 'image': 'assets/birds/cockatiel.png'},
      {'name': 'Lovebird', 'image': 'assets/birds/lovebird.png'},
      {'name': 'Canary', 'image': 'assets/birds/canary.png'},
    ],
    'Fish': [
      {'name': 'Goldfish', 'image': 'assets/fish/goldfish.png'},
      {'name': 'Betta', 'image': 'assets/fish/betta.png'},
      {'name': 'Guppy', 'image': 'assets/fish/guppy.png'},
      {'name': 'Angelfish', 'image': 'assets/fish/angelfish.png'},
    ],
  };

  void onBreedSelected(String breed) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected $breed'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Breed Selector'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: animalBreeds.keys.map((animalType) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      selected: selectedAnimalType == animalType,
                      label: Text(animalType),
                      onSelected: (bool selected) {
                        setState(() {
                          selectedAnimalType = animalType;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: animalBreeds[selectedAnimalType]?.length ?? 0,
              itemBuilder: (ctx, index) {
                final breed = animalBreeds[selectedAnimalType]![index];
                return Card(
                  elevation: 4,
                  child: InkWell(
                    onTap: () => onBreedSelected(breed['name']!),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              breed['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            breed['name']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}