import 'package:eremita_flutter/scenery/scenery.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Eremita of Icberg Flutter Game',
      home: Scenery(),
    );
  }
}
