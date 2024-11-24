import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scenery_state.dart';

class SceneryCubit extends Cubit<SceneryState> {
  final AnimationController characterController;
  final CurvedAnimation characterAnimation;
  final AnimationController groundController;
  final CurvedAnimation groundAnimation;

  SceneryCubit({
    required this.characterController,
    required this.characterAnimation,
    required this.groundController,
    required this.groundAnimation,
  }) : super(SceneryInitial()) {
    characterAnimation.addStatusListener(_characterListener);
    groundAnimation.addStatusListener(_groundListener);
  }

  void _characterListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      characterController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      if (state is SceneryStartedState) {
        emit(SceneryStartedState(isJumping: false, jumpingTimes: 0));
      }
    }
  }

  void _groundListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      groundController.repeat();
    }
  }

  void onTap() {
    final state = this.state;

    if (state is! SceneryStartedState) {
      emit(SceneryStartedState());
      groundController.forward();
      return;
    }

    if (!state.isJumping || state.isJumping && state.jumpingTimes < 3) jump();
  }

  void jump() {
    final state = this.state as SceneryStartedState;
    final jumpingTimes = state.jumpingTimes + 1;
    emit(state.copyWith(isJumping: true, jumpingTimes: jumpingTimes));
    characterController.forward();
  }
}
