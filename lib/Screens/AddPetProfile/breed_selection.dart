import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const PetTypeSelectionScreen(),
    );
  }
}

// PetTypeSelectionScreen remains the same as in your original code
// ... (keep the entire PetTypeSelectionScreen class as is)
class PetTypeSelectionScreen extends StatelessWidget {
  const PetTypeSelectionScreen({super.key});

  final Map<String, Map<String, dynamic>> animalTypes = const {
    'Dog': {
      'icon': Icons.pets,
      'label': 'Dogs',
      'description': 'Loyal companions',
      'color': Colors.brown,
    },
    'Cat': {
      'icon': Icons.center_focus_strong,
      'label': 'Cats',
      'description': 'Independent pets',
      'color': Colors.orange,
    },
    'Bird': {
      'icon': Icons.flutter_dash,
      'label': 'Birds',
      'description': 'Feathered friends',
      'color': Colors.blue,
    },
    'Fish': {
      'icon': Icons.water,
      'label': 'Fish',
      'description': 'Aquatic pets',
      'color': Colors.cyan,
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Pet Type'),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'What type of pet are you interested in?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemCount: animalTypes.length,
                itemBuilder: (context, index) {
                  final entry = animalTypes.entries.elementAt(index);
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BreedSelectionScreen(
                              animalType: entry.key,
                              typeInfo: entry.value,
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              entry.value['icon'] as IconData,
                              size: 48,
                              color: entry.value['color'] as Color,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              entry.value['label'] as String,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              entry.value['description'] as String,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BreedSelectionScreen extends StatefulWidget {
  final String animalType;
  final Map<String, dynamic> typeInfo;

  const BreedSelectionScreen({
    super.key,
    required this.animalType,
    required this.typeInfo,
  });

  @override
  State<BreedSelectionScreen> createState() => _BreedSelectionScreenState();
}

class _BreedSelectionScreenState extends State<BreedSelectionScreen> {
  String? selectedBreed;

  // Keep your existing animalBreeds map and other helper methods...
  static final Map<String, List<Map<String, String>>> animalBreeds = {
    'Dog': [
      {'name': 'Golden Retriever', 'image': 'assets/dogs/golden_retriever.png', 'description': 'Friendly and intelligent'},
      {'name': 'Bulldog', 'image': 'assets/dogs/bulldog.png', 'description': 'Calm and courageous'},
      {'name': 'German Shepherd', 'image': 'assets/dogs/german_shepherd.png', 'description': 'Loyal and confident'},
      {'name': 'Poodle', 'image': 'assets/dogs/poodle.png', 'description': 'Smart and elegant'},
    ],
    'Cat': [
      {'name': 'Persian', 'image': 'assets/cats/persian.png', 'description': 'Sweet and gentle'},
      {'name': 'Siamese', 'image': 'assets/cats/siamese.png', 'description': 'Vocal and social'},
      {'name': 'Maine Coon', 'image': 'assets/cats/maine_coon.png', 'description': 'Large and friendly'},
      {'name': 'British Shorthair', 'image': 'assets/cats/british_shorthair.png', 'description': 'Calm and affectionate'},
    ],
    'Bird': [
      {'name': 'Budgie', 'image': 'assets/birds/budgie.png', 'description': 'Small and playful'},
      {'name': 'Cockatiel', 'image': 'assets/birds/cockatiel.png', 'description': 'Friendly and musical'},
      {'name': 'Lovebird', 'image': 'assets/birds/lovebird.png', 'description': 'Affectionate and social'},
      {'name': 'Canary', 'image': 'assets/birds/canary.png', 'description': 'Melodious singer'},
    ],
    'Fish': [
      {'name': 'Goldfish', 'image': 'assets/fish/goldfish.png', 'description': 'Classic and peaceful'},
      {'name': 'Betta', 'image': 'assets/fish/betta.png', 'description': 'Colorful and elegant'},
      {'name': 'Guppy', 'image': 'assets/fish/guppy.png', 'description': 'Easy to care for'},
      {'name': 'Angelfish', 'image': 'assets/fish/angelfish.png', 'description': 'Graceful swimmer'},
    ],
  };
  void _selectBreed(String breedName) {
    setState(() {
      selectedBreed = breedName;
    });
  }

  void _showBreedDetails(Map<String, String> breed) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(breed['name']!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              breed['image']!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(breed['description']!),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  // Updated _onNextPressed to navigate to PetDateOfBirthScreen
  void _onNextPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PetDateOfBirthScreen(
          animalType: widget.animalType,
          breed: selectedBreed!,
          typeInfo: widget.typeInfo,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select ${widget.typeInfo['label']} Breed'),
        elevation: 2,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: widget.typeInfo['color'].withOpacity(0.1),
            child: Row(
              children: [
                Icon(
                  widget.typeInfo['icon'] as IconData,
                  color: widget.typeInfo['color'] as Color,
                  size: 32,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Choose your favorite ${widget.typeInfo['label']} breed',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: animalBreeds[widget.animalType]?.length ?? 0,
              itemBuilder: (ctx, index) {
                final breed = animalBreeds[widget.animalType]![index];
                final isSelected = selectedBreed == breed['name'];
                return Card(
                  elevation: isSelected ? 8 : 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: isSelected
                        ? BorderSide(
                      color: widget.typeInfo['color'] as Color,
                      width: 2,
                    )
                        : BorderSide.none,
                  ),
                  child: InkWell(
                    onTap: () {
                      _selectBreed(breed['name']!);
                      _showBreedDetails(breed);
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  breed['image']!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              if (isSelected)
                                Positioned(
                                  right: 8,
                                  top: 8,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: widget.typeInfo['color'] as Color,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  breed['name']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  breed['description']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
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
          if (selectedBreed != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: _onNextPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.typeInfo['color'] as Color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
// Keep the rest of the BreedSelectionScreen build method...

class PetDateOfBirthScreen extends StatefulWidget {
  final String animalType;
  final String breed;
  final Map<String, dynamic> typeInfo;

  const PetDateOfBirthScreen({
    super.key,
    required this.animalType,
    required this.breed,
    required this.typeInfo,
  });

  @override
  State<PetDateOfBirthScreen> createState() => _PetDateOfBirthScreenState();
}

class _PetDateOfBirthScreenState extends State<PetDateOfBirthScreen> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 20)),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: widget.typeInfo['color'] as Color,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Keep the existing build method from PetDateOfBirthScreen...
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet\'s Date of Birth'),
        elevation: 2,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: widget.typeInfo['color'].withOpacity(0.1),
            child: Row(
              children: [
                Icon(
                  widget.typeInfo['icon'] as IconData,
                  color: widget.typeInfo['color'] as Color,
                  size: 32,
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'When was your pet born?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 48,
                              color: widget.typeInfo['color'] as Color,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              selectedDate != null
                                  ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                                  : 'Select Date of Birth',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              selectedDate != null
                                  ? 'Age: ${DateTime.now().difference(selectedDate!).inDays ~/ 365} years'
                                  : 'Tap to select date',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (selectedDate != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PetWeightScreen(
                        animalType: widget.animalType,
                        breed: widget.breed,
                        dateOfBirth: selectedDate!,
                        typeInfo: widget.typeInfo,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.typeInfo['color'] as Color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class PetWeightScreen extends StatefulWidget {
  final String animalType;
  final String breed;
  final DateTime dateOfBirth;
  final Map<String, dynamic> typeInfo;

  const PetWeightScreen({
    super.key,
    required this.animalType,
    required this.breed,
    required this.dateOfBirth,
    required this.typeInfo,
  });

  @override
  State<PetWeightScreen> createState() => _PetWeightScreenState();
}

class _PetWeightScreenState extends State<PetWeightScreen> {
  double weight = 0.0;
  bool isKg = true;

  String get formattedWeight {
    return '${weight.toStringAsFixed(1)} ${isKg ? 'kg' : 'lbs'}';
  }

  void _toggleUnit() {
    setState(() {
      if (isKg) {
        weight = weight * 2.20462; // Convert kg to lbs
      } else {
        weight = weight / 2.20462; // Convert lbs to kg
      }
      isKg = !isKg;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Keep the existing build method from PetWeightScreen...
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet\'s Weight'),
        elevation: 2,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: widget.typeInfo['color'].withOpacity(0.1),
            child: Row(
              children: [
                Icon(
                  widget.typeInfo['icon'] as IconData,
                  color: widget.typeInfo['color'] as Color,
                  size: 32,
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'How much does your pet weigh?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                formattedWeight,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 16),
                              IconButton(
                                onPressed: _toggleUnit,
                                icon: const Icon(Icons.swap_horiz),
                                tooltip: 'Switch units',
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Slider(
                            value: weight,
                            min: 0,
                            max: isKg ? 100 : 220,
                            activeColor: widget.typeInfo['color'] as Color,
                            onChanged: (value) {
                              setState(() {
                                weight = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (weight > 0)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Save all the collected information
                  final petInfo = {
                    'type': widget.animalType,
                    'breed': widget.breed,
                    'dateOfBirth': widget.dateOfBirth,
                    'weight': weight,
                    'weightUnit': isKg ? 'kg' : 'lbs',
                  };

                  // Show completion dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Pet Profile Complete!'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Type: ${petInfo['type']}'),
                          Text('Breed: ${petInfo['breed']}'),
                          Text('Date of Birth: ${petInfo['dateOfBirth'].toString().split(' ')[0]}'),
                          // Text('Weight: ${petInfo['weight'].toStringAsFixed(1)} ${petInfo['weightUnit']}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Navigate back to home screen
                            Navigator.of(context).popUntil((route) => route.isFirst);
                          },
                          child: const Text('Done'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.typeInfo['color'] as Color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.check),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}