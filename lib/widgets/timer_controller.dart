import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class TimerController {
  final CountDownController controller;

  TimerController() : controller = CountDownController();

  void start(int duration) {
    controller.restart(duration: duration);
  }

  void stop() {
    controller.pause();
  }

  void reset() {
    controller.restart(duration: 0);
  }
}