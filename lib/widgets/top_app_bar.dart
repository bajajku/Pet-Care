import 'package:flutter/material.dart';

/// Flutter code sample for [AppBar].
void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PetAppBar(),
    );
  }
}


class PetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PetAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('My Pets'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // TODO: Implement search functionality
            print('Search button pressed');
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // TODO: Implement settings functionality
            print('Settings button pressed');
          },
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            // TODO: Implement add pet functionality
            print('Add pet button pressed');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
