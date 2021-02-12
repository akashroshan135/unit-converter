import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context)),
      title: Text(
        'About',
        style: Theme.of(context).textTheme.headline5,
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );

    final appName = Container(
      height: 200,
      child: ListView(children: [
        Container(
          height: 100,
          alignment: Alignment.bottomCenter,
          child: Text(
            'Unit Converter',
            style:
                Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 35.0),
          ),
        ),
        Container(
          height: 100,
          alignment: Alignment.topCenter,
          child: Text(
            'Version: idk ¯\\\_(ツ)_/¯',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ]),
    );

    final appDescription = Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.center,
      child: Text(
        'A small Unit Conversion app I\'m developing while following the \'Build Native Mobile Apps with Flutter\' course on Udacity. I don\'t know why you\'re using this, it\'s just a basic conversion app that doesn\'t even work at the moment but thanks.\n\nUpdate: This app is never gonna be completed. I\'m spending way too much time on this but I need to start working on other stuff. So this is now a dummy experiment app with zero functionality.',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );

    final shamlessPlug = <Widget>[
      Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Text(
          'Check out my GitHub cause \'why not?\'',
          style: Theme.of(context).textTheme.bodyText1,
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
    ];

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: appBar,
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              appName,
              appDescription,
              shamlessPlug[0],
              shamlessPlug[1]
            ],
          ),
        ),
      ),
    );
  }
}
