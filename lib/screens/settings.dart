import 'package:flutter/material.dart';
import 'package:pomodoro/utils/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int pomodoro = 25;
  int shortBreak = 5;
  int longBreak = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              surfaceTintColor: kPrimaryColor,
              color: kPrimaryColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Text(
                      'TIME (MINUTES)',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          timeSection(text: 'pomodoro', time: pomodoro),
                          timeSection(text: 'short break', time: shortBreak),
                          timeSection(text: 'long break', time: longBreak),
                        ],
                      ),
                    ),
                     const Divider(),
                         Text(
                      'FONT',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      dot(),
                      dot()
,
                      dot()

                    ],)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeSection({required String text, required int time}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withOpacity(.7),
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: time,
                icon: const Column(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    )
                  ],
                ),
                dropdownColor: kPrimaryColor,
                items: List.generate(
                  12,
                  (index) => DropdownMenuItem<int>(
                    value: (index + 1) * 5,
                    child: Text(
                      '${(index + 1) * 5}       ',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onChanged: (int? newValue) {
                  setState(() {
                    time = newValue!;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class dot extends StatelessWidget {
  const dot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,horizontal: 8
                ),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              );
  }
}
