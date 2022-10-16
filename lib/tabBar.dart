import 'package:flutter/material.dart';
import 'moonPage.dart';
import 'planetsPage.dart';
import 'solarSystemPage.dart';

class tabBar extends StatefulWidget {
  const tabBar({super.key});

  @override
  State<tabBar> createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> with SingleTickerProviderStateMixin{
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(text: 'Solar System',),
    Tab(text: 'Planets',),
    Tab(text: 'Moon',),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              bottom: TabBar(
                onTap: (value) {},
                controller: _controller,
                tabs: list,
              ),
              title: Text('Space App'),
            )
          ],
          body: TabBarView(controller: _controller, children: [
            Center(
                child: solarSystemPage()),
            Center(
                child: planetsPage()),
            Center(
                child: moonPage()),
          ]),
        )
      ),
    );
  }
}