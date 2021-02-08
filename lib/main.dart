// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'category.dart';

/// The function that is called when main.dart is run.
void main() => runApp(MyApp());

/// This widget is the root of our application.
/// Currently, we just show one widget in our app.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Test Lists',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Lists'),
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding: EdgeInsets.all(8),
              child: IconButton(
                icon: Icon(Icons.info_outline_rounded),
                onPressed: () => print('Shows about page'),
              ),
            )
          ],
        ),
        backgroundColor: Colors.black,
        body: Center(
            child: ListView(
          children: [
            Category('Cake', Icons.ac_unit_sharp, Colors.green),
            Category('Alarm', Icons.access_alarm, Colors.blue[800]),
            Category('_categoryName', Icons.announcement, Colors.lightBlue),
          ],
        )),
      ),
    );
  }
}
