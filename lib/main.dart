import 'package:custom_bottom_navbar/screens/custom_bottom_navbar_screen.dart';
import 'package:flutter/material.dart';

import 'widget/add_bottom_sheet_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const CustomBottomNavbarScreen(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String t = '';
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            t,
            style: const TextStyle(
                fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          IconButton(
              iconSize: 50,
              onPressed: () {
                setState(() {
                  if (i == 0) {
                    t = 'Hello world';
                    i++;
                  } else if (i == 1) {
                    f();
                    i++;
                  } else if (i == 2) {
                    i = 0;
                    t = 'Hello dear';
                  }
                });
              },
              icon: const Icon(Icons.access_time)),
        ],
      )),
    );
  }

  void f() => showModalBottomSheet(
      shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (ctx) => const AddBottomSheetWidget());
}
