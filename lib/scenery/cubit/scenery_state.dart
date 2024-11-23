part of 'scenery_cubit.dart';

sealed class SceneryState {}

final class SceneryInitial extends SceneryState {}

final class SceneryStartedState extends SceneryState {
  final bool isJumping;

  SceneryStartedState({this.isJumping = false});
}

final class SceneryGameOverState extends SceneryState {}
