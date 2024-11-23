import 'package:eremita_flutter/character/character.dart';
import 'package:flutter/material.dart';

class GameStageWidget extends StatelessWidget {
  final Size size;
  final Character character;

  const GameStageWidget({
    super.key,
    required this.size,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/mountains.gif'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          character,
        ],
      ),
    );
  }
}
