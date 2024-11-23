part of 'scenery_cubit.dart';

sealed class SceneryState {}

final class SceneryInitial extends SceneryState {}

final class SceneryStartedState extends SceneryState {
  final bool isJumping;
  final int jumpingTimes;

  SceneryStartedState({
    this.isJumping = false,
    this.jumpingTimes = 0,
  });
}

final class SceneryGameOverState extends SceneryState {}
