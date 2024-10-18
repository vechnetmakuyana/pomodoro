import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pomodoro/blocs/cubit/time_cubit.dart';
import 'package:pomodoro/modals/settings.dart';
import 'package:pomodoro/screens/main_page.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/widgets/dot.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int pomodoro = 25;
  int shortBreak = 5;
  int longBreak = 20;
 SettingsModal? settings;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final box = await Hive.openBox<SettingsModal>('settings');
    settings = box.get('settings') ?? SettingsModal(pomodoro: 25, shortBreak: 5, longBreak: 20);
    setState(() {});
  }

  Future<void> _saveSettings() async {
    log(settings.toString());
    final box = await Hive.openBox<SettingsModal>('settings');
    await box.put('settings', settings!);
context.read<TimeCubit>().getTime();
  }

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
                          timeSection(text: 'pomodoro', time: settings?.pomodoro??25),
                          timeSection(text: 'short break', time: settings?.shortBreak??5),
                          timeSection(text: 'long break', time: settings?.longBreak??10),
                        ],
                      ),
                    ),
                     const Divider(),
                    //      Text(
                    //   'FONT',
                    //   style: TextStyle(
                    //       color: Colors.white.withOpacity(0.7),
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold),
                    // ),

//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                       Dot(),
//                       Dot()
// ,
//                       Dot()

//                     ],),
                       ElevatedButton(
      onPressed: _saveSettings,
      child: const Text('Save Settings'),
    ),
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
                  log(newValue.toString());
                  setState(() {
                    time = newValue!;
                    _onTimeChanged(text, newValue);
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

   void _onTimeChanged(String text, int newValue) {
    setState(() {
      if (text == 'pomodoro') {
        settings!.pomodoro = newValue;
      } else if (text == 'short break') {
        settings!.shortBreak = newValue;
      } else if (text == 'long break') {
        settings!.longBreak = newValue;
      }
    });
  }
}
