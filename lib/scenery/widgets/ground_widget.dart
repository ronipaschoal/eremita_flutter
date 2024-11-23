import 'package:flutter/material.dart';

class GroundWidget extends StatelessWidget {
  final Size size;

  const GroundWidget({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.width,
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
      ],
    );
  }
}
