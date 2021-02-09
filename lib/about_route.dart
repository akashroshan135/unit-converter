import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _textcolor = TextStyle(fontSize: 15, color: Colors.white);

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context)),
      title: Text(
        'About',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      backgroundColor: Colors.black,
    );

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: appBar,
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                height: 200,
                child: ListView(children: [
                  Container(
                    height: 100,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Unit Converter',
                      style: TextStyle(fontSize: 35.0, color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 100,
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Version: idk ¯\\\_(ツ)_/¯',
                      style: _textcolor,
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Text(
                  'A small Unit Conversion app I\'m developing while following the \'Build Native Mobile Apps with Flutter\' course on Udacity. I don\'t know why you\'re using this, it\'s just a basic conversion app that doesn\'t even work at the moment but thanks.',
                  style: _textcolor,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Text(
                  'Check out my GitHub. I make stuff.',
                  style: _textcolor,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: new InkWell(
                  child: new Text(
                    'Akash Roshan',
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                  onTap: () => launch("https://github.com/akashroshan135"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
