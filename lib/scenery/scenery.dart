import 'package:eremita_flutter/character/character.dart';
import 'package:eremita_flutter/scenery/cubit/scenery_cubit.dart';
import 'package:eremita_flutter/scenery/widgets/game_stage_widget.dart';
import 'package:eremita_flutter/scenery/widgets/ground_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Scenery extends StatefulWidget {
  const Scenery({super.key});

  @override
  State<Scenery> createState() => _SceneryState();
}

class _SceneryState extends State<Scenery> with TickerProviderStateMixin {
  var jumping = false;
  var jumpingTimes = 0;
  var onTop = false;

  late final Animation<double> animation;
  late final AnimationController controller;

  late final size = MediaQuery.of(context).size;
  late final groundSize = Size(size.width, size.height * 0.1);
  late final gameStageSize = Size(size.width, size.height * 0.9);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    animation.addStatusListener(_listener);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      jumpingTimes = 0;
      setState(() => jumping = false);
    }
  }

  void _jump() {
    if (jumping && jumpingTimes > 3) return;

    jumpingTimes++;
    setState(() => jumping = true);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SceneryCubit(),
      child: GestureDetector(
        onTap: _jump,
        child: Column(
          children: [
            GameStageWidget(
              size: gameStageSize,
              character: Character(
                animation: animation,
                scenerySize: size,
                isJumping: jumping,
              ),
            ),
            GroundWidget(size: groundSize),
          ],
        ),
      ),
    );
  }
}
