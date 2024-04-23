import 'package:chuva_prototipo/src/domain/models/people_model.dart';
import 'package:flutter/material.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key, required this.people});
  final Map<String, dynamic> people;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
