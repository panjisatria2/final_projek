import 'package:final_project/navigation/home_screen.dart';
import 'package:flutter/material.dart';

import 'profile_screen.dart';
import 'shoop_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ShoopScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.blueAccent,
        items: const[
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/navbar/Home.png')), label: "Home Screen"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/navbar/Icon.png')), label: "Shoop Screen"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/navbar/Profile.png')), label: "Profile Screen")
        ],
      ),
    );
  }
}
