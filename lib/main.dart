import 'dart:collection';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Cheap Fast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Good Cheap Fast'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ToggleState _toggleState = ToggleState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1E9EE),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Transform.scale(
                scale: 2,
                child: Row(
                  children: <Widget>[
                    Switch(
                      value: _toggleState[1],
                      onChanged: (value) {
                        setState(() {
                          _toggleState[1] = value;
                        });
                      },
                      activeColor: Colors.green,
                      inactiveThumbColor: Color(0xFFC1BCC0),
                    ),
                    Text(
                      'GOOD',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Transform.scale(
                scale: 2,
                child: Row(
                  children: <Widget>[
                    Switch(
                      value: _toggleState[2],
                      onChanged: (value) {
                        setState(() {
                          _toggleState[2] = value;
                        });
                      },
                      activeColor: Colors.blue[800],
                      inactiveThumbColor: Color(0xFFC1BCC0),
                    ),
                    Text(
                      'CHEAP',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Transform.scale(
                scale: 2,
                child: Row(
                  children: <Widget>[
                    Switch(
                      value: _toggleState[3],
                      onChanged: (value) {
                        setState(() {
                          _toggleState[3] = value;
                        });
                      },
                      activeColor: Colors.red[800],
                      inactiveThumbColor: Color(0xFFC1BCC0),
                    ),
                    Text(
                      'FAST',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ToggleState extends MapBase<int, bool> {
  final Map<int, bool> _toggleState = {
    1: false,
    2: false,
    3: false,
  };

  @override
  operator [](Object key) {
    return _toggleState[key];
  }

  @override
  void operator []=(key, value) {
    if (value && values.where((value) => value).length >= 2) {
      if (key == 1) {
        _toggleState[3] = false;
      } else {
        _toggleState[key - 1] = false;
      }
    }
    _toggleState[key] = value;
  }

  @override
  void clear() => _toggleState.clear();

  @override
  Iterable<int> get keys => _toggleState.keys;

  @override
  remove(Object key) => _toggleState.remove(key);
}
