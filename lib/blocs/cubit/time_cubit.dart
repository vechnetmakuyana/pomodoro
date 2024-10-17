
import 'package:bloc/bloc.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

part 'time_state.dart';

class TimeCubit extends Cubit<TimeCubitState> {
  final CountDownController controller = CountDownController();

  TimeCubit() : super(const TimeCubitState());

  void setPomodoro(int pomodoro) {}

  void setShortBreak(int shortBreak) {}

  void setLongBreak(int longBreak) {}

  void startPomodoro() {
    emit(state.copyWith(
        duration: state.pomodoro! * 60,
        controller: state.controller,
        isPomodoro: !state.isPomodoro!));
  }

  void startShortBreak() {
    emit(state.copyWith(
        duration: state.shortBreak! * 60,
        controller: state.controller,
        isShortBreak: !state.isShortBreak!));
  }

  void startLongBreak() {
    emit(state.copyWith(
        duration: state.longBreak! * 60,
        controller: state.controller,
        isLongBreak: !state.isLongBreak!));
  }

  void stopTime() {
    controller.reset();
    emit(state.copyWith(pausedTime: false));
  }

  void setDuration(int duration) {
    emit(state.copyWith(duration: duration));
  }

  void startTime() {
    controller.restart(duration: (state.duration));
    emit(state.copyWith(pausedTime: true));
  }

  void changeTimerState(TimerState timerState) {
    switch (timerState) {
      case TimerState.pomodoro:
        startPomodoro();
        break;
      case TimerState.shortBreak:
        startShortBreak();
      case TimerState.longBreak:
        startLongBreak();
      default:
    }

    emit(state.copyWith(timerState: timerState));
  }
}
