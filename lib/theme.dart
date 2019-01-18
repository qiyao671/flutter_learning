import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'Custom Theme',
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: new ThemeScaffold(),
    ));

class ThemeScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Theme'),
        ),
        body: new Center(
          child: new Container(
            //使用了父主题的accent color
            color: Theme.of(context).accentColor,
            child: new Text(
              'Text with a background color',
              //使用了父主题的text主题的title样式
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
        floatingActionButton: new Theme(
          //扩展父主题 覆盖了accentColor
            data: Theme.of(context).copyWith(accentColor: Colors.yellow),
            child: new FloatingActionButton(
              onPressed: null,
              child: new Icon(Icons.build),
            )));
  }
}
