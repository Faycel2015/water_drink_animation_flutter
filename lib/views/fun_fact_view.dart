import 'package:flutter/material.dart';

class FunFactView extends StatelessWidget {
  FunFactView({super.key}); // Add this line

  final List<String> facts = [
    'Drinking water helps maintain the balance of body fluids.',
    'Water helps keep your skin looking good.',
    'Staying hydrated can improve your mood.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fun Facts'),
      ),
      body: ListView.builder(
        itemCount: facts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(facts[index]),
          );
        },
      ),
    );
  }
}
