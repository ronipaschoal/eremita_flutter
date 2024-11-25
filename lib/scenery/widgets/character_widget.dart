import 'package:eremita_flutter/scenery/cubit/scenery_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterWidget extends AnimatedWidget {
  final Size scenerySize;
  final Animation<double> animation;

  const CharacterWidget({
    super.key,
    required this.scenerySize,
    required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final positionTween = Tween<double>(
      begin: 0.0,
      end: scenerySize.height * 0.5,
    );

    return BlocBuilder<SceneryCubit, SceneryState>(
      builder: (context, state) {
        return Positioned(
          bottom: positionTween.evaluate(animation),
          right: (scenerySize.width * 0.5) - 30,
          child: Builder(
            builder: (context) {
              if (state is SceneryStartedState) {
                return state.isJumping
                    ? Image.asset('assets/img/eremita_jumping.png')
                    : Image.asset('assets/img/eremita_walking.gif');
              }
              return Image.asset('assets/img/eremita.png');
            },
          ),
        );
      },
    );
  }
}
