
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro/blocs/cubit/time_cubit.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/widgets/clock_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var timeState = context.watch<TimeCubit>();
    TimerState timerState = timeState.state.timerState;

    return Column(
      children: [
        BlocBuilder<TimeCubit, TimeCubitState>(
          builder: (context, state) {
            return ClockWidget(
              duration: state.duration??0,
              timeState: timeState,
              controller: timeState.controller,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              timerAction(
                context: context,
                onTap: () {
                  context
                      .read<TimeCubit>()
                      .changeTimerState(TimerState.shortBreak);
                },
                text: 'short break',
                timer: TimerState.shortBreak,
              ),
              timerAction(
                context: context,
                onTap: () {
                  context
                      .read<TimeCubit>()
                      .changeTimerState(TimerState.pomodoro);
                },
                text: 'pomodoro',
                timer: TimerState.pomodoro,
              ),
              timerAction(
                context: context,
                onTap: () {
                  context
                      .read<TimeCubit>()
                      .changeTimerState(TimerState.longBreak);
                },
                text: 'long break',
                timer: TimerState.longBreak,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Container(
            height: 8,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: timerState == TimerState.shortBreak
                      ? kPrimaryColor
                      : null,
                  width: 60,
                ),
                Container(
                  color:
                      timerState == TimerState.pomodoro ? kPrimaryColor : null,
                  width: 60,
                ),
                Container(
                  color:
                      timerState == TimerState.longBreak ? kPrimaryColor : null,
                  width: 60,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget timerAction(
      {required TimerState timer,
      required String text,
      required Null Function() onTap,
      required BuildContext context}) {
    var state = context.watch<TimeCubit>();
    TimerState timerState = state.state.timerState;
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: timerState == timer ? 24 : 15,
          color: timerState == timer ? kPrimaryColor : Colors.grey,
        ),
      ),
    );
  }
}
