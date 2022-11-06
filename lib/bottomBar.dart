import 'package:flutter/material.dart';
import 'package:space_edu/moonPage.dart';
import 'package:space_edu/planetsPage.dart';

import 'home.dart';
import 'solarSystemPage.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({super.key});

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
  Center(
    child: home(),
  ),
  Center(
    child: planetsPage(),
  ),
  Center(
    child: moonPage(),
  ),
  Center(
    child: moonPage(),
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 15, 46, 1),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Color.fromRGBO(59, 76, 154, 1)
        ),
        child: Container(
          height: 70,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
            ),
            child: BottomNavigationBar(
              selectedLabelStyle: TextStyle(
                fontFamily: 'Mohave',
                letterSpacing: 2,
                fontSize: 16
                ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'Mohave',
                letterSpacing: 2,
                fontSize: 16
                ),
              backgroundColor: Color.fromRGBO(38, 50, 105, 1),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                  backgroundColor: Color.fromRGBO(59, 76, 154, 1)
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.layers_outlined),
                  label: 'Courses',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.rocket_launch_outlined),
                  label: 'Journey',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_outlined),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
  }
}