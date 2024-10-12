import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/utils/go_router.dart';
import 'package:pomodoro/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title, required this.navigationShell});

  final String title;
  final StatefulNavigationShell navigationShell;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // body: IndexedStack(
      //   index: _selectedIndex,
      //   children: const [
      //     Home(),
      //     Settings(),
      //   ],
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pomodoro',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: kPrimaryColor,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/refresh.svg',
                    // width: 20,
                    // height: 20,
                  ),
                ],
              ),
            ),
            widget.navigationShell,
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 100,
        height: 100,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            shape: const CircleBorder(),
            onPressed: () {},
            child: SvgPicture.asset(
              'assets/images/play.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: widget.navigationShell.currentIndex,
        navigationShell: widget.navigationShell,
      ),
    );
  }
}
