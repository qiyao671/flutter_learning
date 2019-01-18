import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'gesture demo',
      home: new HomePage(),
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('gesture'),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(12),
              child: new CustomButton(),
            ),
            new Container(
              padding: EdgeInsets.all(12),
              child: new CustomButtonWithInk(),
            ),
            new Container(
              padding: EdgeInsets.all(12),
              child: new FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return new DismissingItems(
                          items: new List<String>.generate(
                              20, (i) => "Item ${i + 1}"));
                    }));
                  },
                  color: Theme.of(context).buttonColor,
                  shape: Theme.of(context).buttonTheme.shape,
                  textTheme: Theme.of(context).buttonTheme.textTheme,
                  child: new Text('dismissing items')),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text('Tap'));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Container(
        padding: new EdgeInsets.all(12),
        decoration: new BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(8)),
        child: new Text('My Button'),
      ),
    );
  }
}

class CustomButtonWithInk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {},
      child: new Container(
        padding: new EdgeInsets.all(12),
        decoration: new BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(8)),
        child: new Text('Flat Button'),
      ),
    );
  }
}

class DismissingItems extends StatefulWidget {
  final List<String> items;

  DismissingItems({Key key, @required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new DismissingItemsState();
  }
}

class DismissingItemsState extends State<DismissingItems> {
  void _removeItem(int index) {
    setState(() {
      widget.items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';
    final items = widget.items;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return new Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: new Key(item),
            // We also need to provide a function that will tell our app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              _removeItem(index);

              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text("$item dismissed")));
            },
            // Show a red background as the item is swiped away
            background: new Container(color: Colors.red),
            child: new ListTile(title: new Text('$item')),
          );
        },
      ),
    );
  }
}
