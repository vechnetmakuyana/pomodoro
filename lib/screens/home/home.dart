import 'dart:developer';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro/blocs/cubit/time_cubit.dart';
import 'package:pomodoro/utils/colors.dart';

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
            // log(state.toString());
            // int duration= getDuration(state);
            // log('$duration timer duration');

            return ClockWidget(duration: state.duration!, timeState: timeState,controller:timeState.controller,);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              timerAction(
                context:context,
                onTap: () {
                  context
                      .read<TimeCubit>()
                      .changeTimerState(TimerState.shortBreak);
                      
                },
                text: 'short break',
                timer: TimerState.shortBreak,
              ),
              timerAction(
                context:context,

                onTap: () {
                  context
                      .read<TimeCubit>()
                      .changeTimerState(TimerState.pomodoro);
                },
                text: 'pomodoro',
                timer: TimerState.pomodoro,
              ),
              timerAction(
                context:context,

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
      required Null Function() onTap, required BuildContext context}) {
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

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    super.key,
    required this.duration,
    required this.timeState, required this. controller,
  });

  final int duration;
  final TimeCubit timeState;
  final CountDownController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.only(bottom: 32),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kPrimaryColor,
      ),
      child: CircularCountDownTimer(
        // Countdown duration in Seconds.
        duration: duration,
    
        // Countdown initial elapsed Duration in Seconds.
        initialDuration: 0,
    
        // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
        controller: timeState.controller,
    
        // Width of the Countdown Widget.
        width: MediaQuery.of(context).size.width / 2,
    
        // Height of the Countdown Widget.
        height: MediaQuery.of(context).size.height / 3,
    
        // Ring Color for Countdown Widget.
        ringColor: kPrimaryColor,
    
        // Ring Gradient for Countdown Widget.
        ringGradient: null,
    
        // Filling Color for Countdown Widget.
        fillColor: Colors.white,
    
        // Filling Gradient for Countdown Widget.
        fillGradient: null,
    
        // Background Color for Countdown Widget.
        // backgroundColor: kPrimaryColor,
    
        // Background Gradient for Countdown Widget.
        backgroundGradient: null,
    
        // Border Thickness of the Countdown Ring.
        strokeWidth: 8.0,
    
        // Begin and end contours with a flat edge and no extension.
        strokeCap: StrokeCap.round,
    
        // Text Style for Countdown Text.
        textStyle: const TextStyle(
          fontSize: 48.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
    
        // Format for the Countdown Text.
        textFormat: CountdownTextFormat.MM_SS,
    
        // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
        isReverse: true,
    
        // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
        isReverseAnimation: false,
    
        // Handles visibility of the Countdown Text.
        isTimerTextShown: true,
    
        // Handles the timer start.
        autoStart: false,
    
        // This Callback will execute when the Countdown Starts.
        onStart: () {
          // Here, do whatever you want
          debugPrint('Countdown Started');
        },
    
        // This Callback will execute when the Countdown Ends.
        onComplete: () {
          // Here, do whatever you want
          debugPrint('Countdown Ended');
        },
    
        // timeFormatterFunction: (defaultFormatterFunction, duration) {
        //   if (duration.inSeconds == 0) {
        //     //only format for '0'
        //     return "Start";
        //   } else {
        //     //others durations by it's default format
        //     return Function.apply(defaultFormatterFunction, [duration]);
        //   }
        // },
    
        // This Callback will execute when the Countdown Changes.
        onChange: (String timeStamp) {
          // Here, do whatever you want
          debugPrint('Countdown Changed $timeStamp');
        },
      ),
    );
  }
}
