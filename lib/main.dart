import 'package:flutter/material.dart';
import 'package:pet_care/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'Screens/add_pet_screen.dart';
import 'Screens/home_screen.dart';
import 'providers/pet_provider.dart';

void main() {
  runApp(const PetCareApp());
}

class PetCareApp extends StatelessWidget {
  const PetCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PetProvider()), // PetProvider here
      ],
      child: MaterialApp(
        title: 'Pet Care App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BottomNavigationBarExample()
      ),
    );
  }
}

