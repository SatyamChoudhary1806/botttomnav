import 'package:botttomnav/LoginPage.dart';
import 'package:botttomnav/weatherPage.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'bmimain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static const title = 'bottom_bar';

  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;
  List pages = const [HomePage(), Loginpage(), BMImainScreen()];
  List title = ["Current Weather", "Login Here", "BMI PAGE"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: title[_currentIndex],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title[_currentIndex]),
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(blurStyle:BlurStyle.outer , blurRadius: 7, color: Colors.grey)]),
          child: SalomonBottomBar(
            backgroundColor: Colors.white,
            itemPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                activeIcon: const Icon(Icons.home_outlined),
                selectedColor: Colors.cyan,
                unselectedColor: Colors.blueGrey,
              ),

              /// Upload
              SalomonBottomBarItem(
                icon: const Icon(Icons.add_a_photo_rounded),
                activeIcon: const Icon(Icons.add_to_home_screen),
                title: const Text("Upload Image"),
                selectedColor: Colors.green.shade800,
                unselectedColor: Colors.blueGrey,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                activeIcon: const Icon(Icons.person_outline_outlined),
                title: const Text("Profile"),
                selectedColor: Colors.teal,
                unselectedColor: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
