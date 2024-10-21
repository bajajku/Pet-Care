import 'package:flutter/material.dart';
import 'package:pet_care/widgets/bottom_nav_bar.dart';
import 'package:pet_care/widgets/pet_care_home_page.dart';
import 'package:pet_care/widgets/top_app_bar.dart';
import 'package:provider/provider.dart';
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
        ChangeNotifierProvider(create: (_) => PetProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PetCareHomePage(),
      ),
    );
  }
}

class PetCareHomePage extends StatelessWidget {
  const PetCareHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomNavigationBarExample(),
    );
  }
}