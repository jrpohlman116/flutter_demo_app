import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _switch = true;
  Icon _symbol = Icon(Icons.add);

  void _incrementCounter() {
    setState(() {
      _counter += _switch ? 1 : -1;
    });
  }

  bool _toggleSwitch(bool value) {
    setState(() {
      _switch = value;
    });
    if (value){
      setState(() {
        _symbol = Icon(Icons.add);
      });
    } else {
      setState(() {
        _symbol = Icon(Icons.remove);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Switch(
              value: _switch,
              onChanged: _toggleSwitch,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: _symbol,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}