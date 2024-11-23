import 'package:eremita_flutter/scenery/cubit/scenery_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Character extends AnimatedWidget {
  final Size scenerySize;
  final Animation<double> animation;
  final bool isJumping;

  const Character({
    super.key,
    required this.scenerySize,
    required this.animation,
    required this.isJumping,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final sizeTween = Tween<double>(
      begin: 0.0,
      end: scenerySize.height * 0.5,
    );

    return BlocBuilder<SceneryCubit, SceneryState>(
      builder: (context, state) {
        return Positioned(
          bottom: sizeTween.evaluate(animation),
          right: (scenerySize.width * 0.5) - 30,
          child: Builder(
            builder: (context) {
              if (state is SceneryInitial || state is SceneryGameOverState) {
                return Image.asset('assets/img/eremita.png');
              }
              return !isJumping
                  ? Image.asset('assets/img/eremita_walking.gif')
                  : Image.asset('assets/img/eremita_jumping.png');
            },
          ),
        );
      },
    );
  }
}
