import 'package:flutter/material.dart';

import 'package:flutter_demo2/widgets/category.dart';
import 'about_route.dart';

const _BGColor = Colors.black;

class CategoryRoute extends StatelessWidget {
  CategoryRoute();

  static const _categoryIcon = [
    Icons.timeline,
    Icons.landscape,
    Icons.add_outlined,
    Icons.add_outlined,
    Icons.access_time,
    Icons.sd_storage,
    Icons.electrical_services,
    Icons.monetization_on,
  ];

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Unit Converter',
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
      backgroundColor: _BGColor,
      actions: [
        Padding(
          padding: EdgeInsets.all(8),
          child: IconButton(
            icon: Icon(Icons.info_outline_rounded),
            // * Navigator pushes the new screen to stack
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutScreen()),
            ),
          ),
        ),
      ],
    );

    final listview = Container(
      // color: _BGColor,
      child: ListView.builder(
        itemCount: _categoryNames.length,
        itemBuilder: (BuildContext context, int index) {
          return Category(
              _categoryNames[index], _categoryIcon[index], _baseColors[index]);
        },
      ),
    );

    return Scaffold(backgroundColor: _BGColor, appBar: appBar, body: listview);
  }
}
