import 'package:flutter/material.dart';
import 'package:pet_care/Screens/add_pet_screen.dart';
import 'package:pet_care/Screens/home_screen.dart';
import 'package:pet_care/widgets/top_app_bar.dart';

void main() => runApp(const PetCareApp());

class PetCareApp extends StatelessWidget {
  const PetCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}
PreferredSizeWidget? _getAppBarForSelectedIndex(int index) {
  switch (index) {
    case 0:
      return PetAppBar();
    case 1:
      return AppBar(title: const Text('PetProfile '));
    case 2:
      return AppBar(title: const Text('Schedule'));
    case 3:
      return AppBar(title: const Text('Pet friendly places'));
    case 4:
      return AppBar(title: const Text('Cart'));
    default:
      return null; // No AppBar for this screen
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {


  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),        // Home/Dashboard screen
    AddPetScreen(),
    Text(
      'Schedule: Manage Care Schedule',
      style: optionStyle,
    ),
    Text(
      'Recommendations: Pet-Friendly Places and Services',
      style: optionStyle,
    ),
    Text(
      'Store: Browse and Order Supplies',
      style: optionStyle,
    ),     // Store screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBarForSelectedIndex(_selectedIndex),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Alternatively, use Icons.pets for a paw print
            label: 'Dashboard',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets), // Pet Silhouette
            label: 'Pets Profile',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule), // Calendar/Clock
            label: 'Schedule',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin), // Map Pin
            label: 'Recommendations',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), // Shopping Cart
            label: 'Store',
            backgroundColor: Colors.red,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
