import 'package:flutter/material.dart';

const _padding = EdgeInsets.all(16.0);

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
  // var _bgColor = Colors.white;
  // var _textColor = Colors.black;
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

    final input = Padding(
      padding: _padding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        TextField(
          keyboardType: TextInputType.number,
          cursorColor: widget.categoryColor,
          style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 35),
          decoration: InputDecoration(
            labelText: 'Input',
            labelStyle: TextStyle(color: widget.categoryColor),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: widget.categoryColor, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: widget.categoryColor, width: 1)),
          ),
        ),
      ]),
    );

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: appBar,
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: _padding,
          child: ListView(
            children: [input],
          ), /*
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
        */
        ),
      ),
    );
  }
}
