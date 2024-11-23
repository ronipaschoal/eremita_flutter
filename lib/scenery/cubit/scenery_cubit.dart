import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scenery_state.dart';

class SceneryCubit extends Cubit<SceneryState> {
  final AnimationController controller;
  final CurvedAnimation animation;

  SceneryCubit({
    required this.controller,
    required this.animation,
  }) : super(SceneryInitial()) {
    animation.addStatusListener(_listener);
  }

  void _listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      if (state is SceneryStartedState) {
        emit(SceneryStartedState(isJumping: false, jumpingTimes: 0));
      }
    }
  }

  void onTap() {
    final state = this.state;

    if (state is! SceneryStartedState) {
      emit(SceneryStartedState());
      return;
    }

    if (!state.isJumping && state.jumpingTimes < 3) jump();
  }

  void jump() {
    final jumpingTimes = (state as SceneryStartedState).jumpingTimes + 1;
    emit(SceneryStartedState(isJumping: true, jumpingTimes: jumpingTimes));
    controller.forward();
  }
}
