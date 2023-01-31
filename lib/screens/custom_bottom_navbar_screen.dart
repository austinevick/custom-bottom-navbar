import 'package:custom_bottom_navbar/screens/add_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

import 'change_view_bottom_sheet.dart';

class CustomBottomNavbarScreen extends StatefulWidget {
  const CustomBottomNavbarScreen({super.key});

  @override
  State<CustomBottomNavbarScreen> createState() =>
      _CustomBottomNavbarScreenState();
}

class _CustomBottomNavbarScreenState extends State<CustomBottomNavbarScreen> {
  int selectedIndex = 0;
  int b = 0;
  int selectedTile = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
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

  Widget buildBody() {
    return [
      Container(
        color: Colors.purple,
        child: const Center(child: Text('HOME')),
      ),
      Container(
        color: Colors.green,
        child: const Center(child: Text('EXPLORE')),
      ),
      Container(
        color: Colors.amber,
        child: const Center(child: Text('')),
      ),
      buildSubscribe(),
      Container(
        color: Colors.black,
        child: const Center(child: Text('SETTINGS')),
      ),
    ][selectedIndex];
  }

  Widget buildSubscribe() {
    switch (selectedTile) {
      case 0:
        return Container(
          color: Colors.brown,
          child: const Center(child: Text('SUBSCRIBE')),
        );
      case 1:
        return Container(
          color: Colors.brown,
          child: const Center(child: Text('Libray')),
        );
    }
    return Container();
  }

  String label(int i) {
    switch (i) {
      case 0:
        return 'Home';
      case 1:
        return 'Explore';
      case 3:
        return 'Subscribe';
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
        return Icons.subscriptions;
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
              if (b == 0) {
                b++;
              } else if (b == 1) {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) => ChangeViewBottomSheet(
                          selectedTile: selectedTile,
                          onItemOneTap: () => setState(() => selectedTile = 0),
                          onItemTwoTap: () => setState(() => selectedTile = 1),
                        ));
              }
            } else if (i != 3) {
              b = 0;
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
