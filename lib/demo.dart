import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Demo',
    home: new TutorialHome(),
  ));
}

class MyAppBar extends StatelessWidget {
  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56,
      padding: EdgeInsets.only(left: 8, right: 8),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation Menu',
            onPressed: null,
          ),
          new Expanded(child: title),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text('Demo'),
          ),
          new Text('Hello, World'),
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {
                print('add was pressed');
              })
        ],
      ),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: null,
          tooltip: 'menu',
        ),
        title: new Text('Tutorial'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: null,
            tooltip: 'search',
          )
        ],
      ),
      body: new Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Row(
        children: <Widget>[
          new CounterDisplay(
            count: _counter,
          ),
          new CounterIncrementor(
            callback: () {
              _increase();
            },
          )
        ],
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  int count = 0;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    return new Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  VoidCallback callback;

  CounterIncrementor({this.callback});

  @override
  Widget build(BuildContext context) {
    return new IconButton(icon: new Icon(Icons.add), onPressed: callback);
  }
}
