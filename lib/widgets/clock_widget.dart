import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/blocs/cubit/time_cubit.dart';
import 'package:pomodoro/utils/colors.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    super.key,
    required this.duration,
    required this.timeState,
    required this.controller,
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
