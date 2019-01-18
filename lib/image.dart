import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(new MaterialApp(
      title: 'Image',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Image'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                height: 300,
                //缓存图
                child: new CachedNetworkImage(
                  placeholder: new CircularProgressIndicator(),
                  imageUrl:
                      'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true',
                ),
              ),
              new Container(
                //使用占位图
                  child: FadeInImage.assetNetwork(
                placeholder: 'graphics/placeholder.jpg',
                image:
                    'https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png',
              )),
            ],
          ),
        ),
      ),
    ));
