import 'package:flutter/material.dart';

class Product {
  String name;

  Product({this.name});
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onChartChanged;

  ShoppingListItem({this.product, this.inCart, this.onChartChanged});

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    return !inCart
        ? null
        : new TextStyle(
            color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(
        product.name,
        style: _getTextStyle(context),
      ),
      onTap: () {
        onChartChanged(product, !inCart);
      },
    );
  }
}

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  ShoppingList({Key key, this.products}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new ShoppingListState();
}

class ShoppingListState extends State<ShoppingList> {
  final Set<Product> _shoppingCart = new Set();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new ListView(
          padding: EdgeInsets.all(8),
          children: widget.products.map((product) {
            return new ShoppingListItem(
              product: product,
              inCart: _shoppingCart.contains(product),
              onChartChanged: _handleCartChanged,
            );
          }).toList()),
    );
  }
}

void main() => runApp(new MaterialApp(
      title: 'Shopping App',
      home: new ShoppingList(
        products: [
          new Product(name: 'egg'),
          new Product(name: 'cloth'),
          new Product(name: 'pants'),
          new Product(name: 'pencil'),
          new Product(name: 'eraser')
        ],
      ),
    ));
