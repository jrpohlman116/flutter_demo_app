import 'package:flutter/material.dart';
import 'package:flutterdemoapp/generator.dart';
import 'package:flutterdemoapp/homepage.dart';
import 'package:flutterdemoapp/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tabbed AppBar'),
            bottom: TabBar(
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              MyHomePage(),
              MenuPage(),
              GeneratorPage()
            ]
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Home', icon: Icons.home),
  const Choice(title: 'Menu', icon: Icons.menu),
  const Choice(title: 'Generator', icon: Icons.restaurant),
];



