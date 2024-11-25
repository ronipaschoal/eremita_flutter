import 'package:eremita_flutter/character/character.dart';
import 'package:eremita_flutter/menu/menu_start_widget.dart';
import 'package:eremita_flutter/scenery/cubit/scenery_cubit.dart';
import 'package:eremita_flutter/scenery/widgets/game_stage_widget.dart';
import 'package:eremita_flutter/scenery/widgets/ground_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Scenery extends StatefulWidget {
  const Scenery({super.key});

  @override
  State<Scenery> createState() => _SceneryState();
}

class _SceneryState extends State<Scenery> with TickerProviderStateMixin {
  late final _characterController = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );

  late final _characterAnimation = CurvedAnimation(
    parent: _characterController,
    curve: Curves.easeOut,
  );

  late final _groundController = AnimationController(
    duration: const Duration(milliseconds: 100),
    vsync: this,
  );

  late final _groundAnimation = CurvedAnimation(
    parent: _groundController,
    curve: Curves.easeInOut,
  );

  late final _cubit = SceneryCubit(
    characterController: _characterController,
    characterAnimation: _characterAnimation,
    groundController: _groundController,
    groundAnimation: _groundAnimation,
  );

  @override
  void dispose() {
    _characterController.dispose();
    _groundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) => _cubit,
      child: GestureDetector(
        onTap: _cubit.onTap,
        child: Stack(
          children: [
            Column(
              children: [
                GameStageWidget(
                  size: Size(
                    size.width,
                    size.height * 0.9,
                  ),
                  character: Character(
                    animation: _characterAnimation,
                    scenerySize: size,
                  ),
                ),
                Flexible(
                  child: GroundWidget(
                    animation: _groundAnimation,
                    size: Size(
                      size.width,
                      size.height * 0.1,
                    ),
                  ),
                ),
              ],
            ),
            MenuStartWidget(
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
