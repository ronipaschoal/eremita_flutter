import 'package:eremita_flutter/scenery/scenery.dart';
import 'package:eremita_flutter/ui/widgets/flutter_banner_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eremita of Iceberg Flutter Game',
      home: FlutterBannerWidget(child: Scenery()),
    );
  }
}
