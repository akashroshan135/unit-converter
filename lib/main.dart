import 'package:flutter/material.dart';

import 'routes/category_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Test Lists',
      home: CategoryRoute(),
    );
  }
}
