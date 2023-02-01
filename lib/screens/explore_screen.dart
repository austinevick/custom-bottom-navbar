import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore'), centerTitle: true),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, i) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 75,
                  child: Card(
                    color: Colors.red,
                  ),
                ),
              )),
    );
  }
}
