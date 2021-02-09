import 'package:flutter/material.dart';

class ConverterScreen extends StatelessWidget {
  final categoryName;
  final categoryColor;

  const ConverterScreen(
    this.categoryName,
    this.categoryColor,
  );

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          // * Navigator pops the old screen from stack
          onPressed: () => Navigator.pop(context)),
      title: Text(
        categoryName,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      backgroundColor: categoryColor,
    );

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: appBar,
        body: Container(
          color: Colors.black,
          child: Center(
            child: Text(
              'Hello World',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
