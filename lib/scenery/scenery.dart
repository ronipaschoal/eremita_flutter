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
  late final controller = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );

  late final animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeOut,
  );

  late final _cubit = SceneryCubit(
    controller: controller,
    animation: animation,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) => _cubit,
      child: GestureDetector(
        onTap: _cubit.onTap,
        child: Column(
          children: [
            GameStageWidget(
              size: Size(
                size.width,
                size.height * 0.9,
              ),
              character: Character(
                animation: animation,
                scenerySize: size,
              ),
            ),
            GroundWidget(
              size: Size(
                size.width,
                size.height * 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
