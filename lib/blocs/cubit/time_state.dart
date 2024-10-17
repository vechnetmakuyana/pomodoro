part of 'time_cubit.dart';

class TimeCubitState {
  final int? pomodoro;
  final bool? isPomodoro;
  final int? shortBreak;
  final bool? isShortBreak;

  final int? longBreak;
  final bool? isLongBreak;
  final bool? pausedTime;
  final int? duration;
  final TimerState timerState;
  final CountDownController? controller;

  const TimeCubitState({
    this.pomodoro=30,
    this.isPomodoro=false,
    this.shortBreak=5,
    this.isShortBreak=false,
    this.longBreak=20,
    this.isLongBreak=false,
    this.pausedTime=false,
    this.duration=30*60,
    this.timerState = TimerState.pomodoro,
    this.controller,
  });

  TimeCubitState copyWith({
    int? pomodoro,
    bool? isPomodoro,
    int? shortBreak,
    bool? isShortBreak,
    int? longBreak,
    bool? isLongBreak,
    bool? pausedTime,
    int? duration,
    TimerState? timerState,
    CountDownController? controller,
  }) {
    return TimeCubitState(
      pomodoro: pomodoro ?? this.pomodoro,
      isPomodoro: isPomodoro ?? this.isPomodoro,
      shortBreak: shortBreak ?? this.shortBreak,
      isShortBreak: isShortBreak ?? this.isShortBreak,
      longBreak: longBreak ?? this.longBreak,
      isLongBreak: isLongBreak ?? this.isLongBreak,
      pausedTime: pausedTime ?? this.pausedTime,
      duration: duration ?? this.duration,
      timerState: timerState ?? this.timerState,
      controller: controller ?? this.controller,
    );
  }
}

enum TimerState{
  pomodoro,
  shortBreak,
  longBreak
}