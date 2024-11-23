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

  SceneryStartedState copyWith({
    bool? isJumping,
    int? jumpingTimes,
  }) {
    return SceneryStartedState(
      isJumping: isJumping ?? this.isJumping,
      jumpingTimes: jumpingTimes ?? this.jumpingTimes,
    );
  }
}

final class SceneryGameOverState extends SceneryState {}
