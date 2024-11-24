import 'package:flutter/material.dart';

class GroundWidget extends AnimatedWidget {
  final Size size;
  final Animation<double> animation;

  const GroundWidget({
    super.key,
    required this.size,
    required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final positionTween = Tween<double>(
      begin: -size.width / 2,
      end: 0.0,
    );

    return Stack(
      children: [
        Positioned(
          right: positionTween.evaluate(animation),
          child: Container(
            width: size.width * 1.5,
            height: size.height,
            decoration: const BoxDecoration(
              color: Color(0xFF9dd1e4),
              image: DecorationImage(
                image: AssetImage('assets/img/blue_ground.gif'),
                repeat: ImageRepeat.repeatX,
                alignment: Alignment.topLeft,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
