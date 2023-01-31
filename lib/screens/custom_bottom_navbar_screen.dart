import 'package:custom_bottom_navbar/screens/explore_screen.dart';
import 'package:custom_bottom_navbar/screens/home_screen.dart';
import 'package:custom_bottom_navbar/screens/library_screen.dart';
import 'package:custom_bottom_navbar/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import '../widget/add_bottom_sheet_widget.dart';
import '../widget/change_view_bottom_sheet.dart';

class CustomBottomNavbarScreen extends StatefulWidget {
  const CustomBottomNavbarScreen({super.key});

  @override
  State<CustomBottomNavbarScreen> createState() =>
      _CustomBottomNavbarScreenState();
}

class _CustomBottomNavbarScreenState extends State<CustomBottomNavbarScreen> {
  int selectedIndex = 0;
  int libraryIndex = 0;
  int libraryCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomeScreen(),
        const ExploreScreen(),
        Container(), //Just here as a placeholder
        LibraryScreen(index: libraryCurrentIndex),
        const SettingsScreen()
      ][selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: 60,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (i) {
                if (i == 2) {
                  return Align(
                      alignment: Alignment.center,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 38,
                          onPressed: () => showModalBottomSheet(
                              shape: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              context: context,
                              builder: (ctx) => const AddBottomSheetWidget()),
                          icon: const Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                          )));
                }

                return bottomNavIcon(i);
              })),
        ),
      ),
    );
  }

  String label(int i) {
    switch (i) {
      case 0:
        return 'Home';
      case 1:
        return 'Explore';
      case 3:
        return 'Library';
      case 4:
        return 'Settings';
    }
    return '';
  }

  IconData icon(int i) {
    switch (i) {
      case 0:
        return Icons.home_filled;
      case 1:
        return Icons.explore;
      case 3:
        return Icons.library_music;
      case 4:
        return Icons.settings;
    }
    return Icons.home_filled;
  }

  Widget bottomNavIcon(int i) => IconButton(
      padding: EdgeInsets.zero,
      onPressed: () => setState(() {
            selectedIndex = i;
            if (i == 3) {
              if (libraryIndex == 0) {
                libraryIndex++;
              } else if (libraryIndex == 1) {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) => ChangeViewBottomSheet(
                          selectedTile: libraryCurrentIndex,
                          onItemOneTap: () {
                            Navigator.of(context).pop();
                            setState(() => libraryCurrentIndex = 0);
                          },
                          onItemTwoTap: () {
                            Navigator.of(context).pop();
                            setState(() => libraryCurrentIndex = 1);
                          },
                        ));
              }
            } else if (i != 3) {
              libraryIndex = 0;
            }
          }),
      icon: Column(
        children: [
          Expanded(
              child: Icon(
            icon(i),
            color: selectedIndex == i ? Colors.red : Colors.grey,
          )),
          Text(
            label(i),
            style: TextStyle(
                fontSize: 10.6,
                color: selectedIndex == i ? Colors.red : Colors.grey,
                fontWeight:
                    selectedIndex == i ? FontWeight.bold : FontWeight.normal),
          )
        ],
      ));
}
