import 'package:flutter/material.dart';
import 'package:space_edu/moonPage.dart';
import 'package:space_edu/planetsPage.dart';

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
    child: solarSystemPage(),
  ),
  Center(
    child: planetsPage(),
  ),
  Center(
    child: moonPage(),
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Space App"),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch_outlined),
            label: 'Journey',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favorite',
          ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,      
      ),
    );
  }

  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
  }
}