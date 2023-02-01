import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  final int index;
  const LibraryScreen({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return Scaffold(
        appBar: AppBar(title: const Text('Library'), centerTitle: true),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, i) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 75,
                    child: Card(
                      color: Colors.pink,
                    ),
                  ),
                )),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('Device'), centerTitle: true),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, i) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 75,
                    child: Card(
                      color: Colors.green,
                    ),
                  ),
                )),
      );
    }
  }
}
