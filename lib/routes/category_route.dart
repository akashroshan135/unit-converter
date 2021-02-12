import 'package:flutter/material.dart';

import 'package:unit_converter/widgets/category.dart';
import 'about_route.dart';
import 'package:unit_converter/category_data.dart';

class CategoryRoute extends StatefulWidget {
  CategoryRoute();

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Unit Converter',
        style: Theme.of(context).textTheme.headline6,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      actions: [
        Padding(
          padding: EdgeInsets.all(8),
          child: IconButton(
            icon: Icon(
              Icons.info_outline_rounded,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
            // * Navigator pushes the new screen to stack
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutScreen()),
            ),
          ),
        ),
      ],
    );

    final listview = ListView.builder(
      itemCount: CategoryData.categoryNames.length,
      itemBuilder: (BuildContext context, int index) {
        return Category(
          CategoryData.categoryNames[index],
          CategoryData.categoryIcon[index],
          CategoryData.baseColors[index],
        );
      },
    );

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: appBar,
        body: Container(child: listview));
  }
}
