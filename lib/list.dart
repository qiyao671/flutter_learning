import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'list demo',
      home: new Home(),
    ));

class Home extends StatelessWidget {
  void pushPage(BuildContext context, WidgetBuilder builder) {
    Navigator.of(context).push(new MaterialPageRoute(builder: builder));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('list demo'),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                pushPage(context, (context) {
                  return new BasicList();
                });
              },
              child: new Container(
                padding: EdgeInsets.all(16),
                child: new Text(
                  'basic list',
                  style:
                      Theme.of(context).textTheme.body1.copyWith(fontSize: 16),
                ),
              ),
            ),
            new Divider(),
            new GestureDetector(
              onTap: () {
                pushPage(context, (context) {
                  return new HorizontalList();
                });
              },
              child: new Container(
                color: Colors.lightGreen,
                padding: EdgeInsets.all(16),
                child: new Text(
                  'horizontal list',
                  style:
                      Theme.of(context).textTheme.body1.copyWith(fontSize: 16),
                ),
              ),
            ),
            new Divider(),
            new Text('长列表参考main.dart'),
            new Divider(),
            new GestureDetector(
              onTap: () {
                pushPage(context, (context) {
                  return new MultiTypeList();
                });
              },
              child: new Container(
                padding: EdgeInsets.all(16),
                child: new Text(
                  'mutiple type list',
                  style:
                      Theme.of(context).textTheme.body1.copyWith(fontSize: 16),
                ),
              ),
            ),
            new GestureDetector(
              onTap: () {
                pushPage(context, (context) {
                  return new GridViewDemo();
                });
              },
              child: new Container(
                padding: EdgeInsets.all(16),
                child: new Text(
                  'grid view',
                  style:
                      Theme.of(context).textTheme.body1.copyWith(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//基本的垂直列表
class BasicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('basic list'),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.map),
            title: new Text('Map'),
          ),
          new ListTile(
            leading: new Icon(Icons.photo),
            title: new Text('Album'),
          ),
          new ListTile(
            leading: new Icon(Icons.phone),
            title: new Text('Phone'),
          ),
        ],
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('horizontal list'),
      ),
      body: new Container(
        margin: new EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            new Container(
              width: 160.0,
              color: Colors.red,
            ),
            new Container(
              width: 160.0,
              color: Colors.blue,
            ),
            new Container(
              width: 160.0,
              color: Colors.green,
            ),
            new Container(
              width: 160.0,
              color: Colors.yellow,
            ),
            new Container(
              width: 160.0,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('grid view'),
        ),
        body: new GridView.count(
          crossAxisCount: 3,
          children: new List.generate(100, (i) {
            return new Center(
              child: new Text(
                'item $i',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
        ));
  }
}

class MultiTypeList extends StatelessWidget {
  final List<ListItem> _items = List<ListItem>.generate(
      1000,
      (i) => i % 6 == 0
          ? new HeadingItem('heading $i')
          : new MessageItem('sender $i', 'body $i'));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('multiple type list'),
      ),
      body: new ListView.builder(itemBuilder: (context, i) {
        var item = _items[i];
        if (item is MessageItem) {
          return new ListTile(
            title: new Text(item.sender),
            subtitle: new Text(item.body),
          );
        } else if (item is HeadingItem) {
          return new ListTile(
            title: new Text(item.heading),
          );
        }
      }),
    );
  }
}

// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
