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
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
