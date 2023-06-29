import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  Duration selectedDuration = const Duration();

  String formatDuration(Duration duration) {
    String hours = duration.inHours.toString();
    String minutes = duration.inMinutes.remainder(60).toString();

    return "$hours hours : $minutes minutes";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedIndex: currentIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.add_circle_sharp),
            label: "Add app",
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_sharp),
            label: "My list",
          )
        ],
      ),
      body: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(formatDuration(selectedDuration)),
              SingleChildScrollView(
                child: CupertinoTimerPicker(
                  onTimerDurationChanged: (Duration duration) {
                    setState(() {
                      selectedDuration = duration;
                    });
                  },
                  mode: CupertinoTimerPickerMode.hm,
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Save")),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Page 2'),
            ],
          ),
        ),
      ][currentIndex],
    );
  }
}
