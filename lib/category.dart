// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final categoryName;
  final categoryIcon;
  final categoryColor;

  const Category(
    this.categoryName,
    this.categoryIcon,
    this.categoryColor,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      
      child: Container(
        
        height: 80,
        child: Material(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[900],
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            highlightColor: categoryColor,
            splashColor: categoryColor,
            onTap: () {
              print('I was tapped!');
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    categoryIcon,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Center(
                  child: Text(categoryName,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
