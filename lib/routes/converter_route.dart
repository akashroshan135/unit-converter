import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  final categoryName;
  final categoryColor;

  const ConverterScreen(
    this.categoryName,
    this.categoryColor,
  );

  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  var _bgColor = Colors.white;
  var _textColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          // * Navigator pops the old screen from stack
          onPressed: () => Navigator.pop(context)),
      title: Text(
        widget.categoryName,
        style: Theme.of(context).textTheme.headline5,
      ),
      backgroundColor: widget.categoryColor,
    );

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: appBar,
        body: Container(
          color: _bgColor,
          child: FlatButton(
            onPressed: () => setState(() {
              _bgColor = Colors.black;
              _textColor = Colors.white;
            }),
            child: Center(
              child: Text(
                'Hello World',
                style: TextStyle(color: _textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
