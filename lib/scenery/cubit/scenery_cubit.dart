import 'package:flutter_bloc/flutter_bloc.dart';

part 'scenery_state.dart';

class SceneryCubit extends Cubit<SceneryState> {
  SceneryCubit() : super(SceneryInitial());

  void start() {
    emit(SceneryStartedState());
  }
}
