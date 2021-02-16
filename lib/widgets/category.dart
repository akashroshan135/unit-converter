import 'package:flutter/material.dart';

import 'package:unit_converter/routes/converter_route.dart';
import 'package:unit_converter/widgets/unit.dart';

class Category extends StatelessWidget {
  final categoryName;
  final categoryIcon;
  final categoryColor;

  const Category({
    @required this.categoryName,
    @required this.categoryIcon,
    @required this.categoryColor,
  })  : assert(categoryName != null),
        assert(categoryIcon != null),
        assert(categoryColor != null);

  List<Unit> _buildUnits() {
    return List.generate(10, (int i) {
      i++;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 80,
        child: Material(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).secondaryHeaderColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            highlightColor: categoryColor[400],
            splashColor: categoryColor,
            onTap: () {
              // * Navigator pushes the new screen to stack
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConverterScreen(
                      categoryName: categoryName,
                      categoryColor: categoryColor,
                      units: _buildUnits()),
                ),
              );
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    categoryIcon,
                    color: Theme.of(context).primaryIconTheme.color,
                    size: Theme.of(context).primaryIconTheme.size,
                  ),
                ),
                Center(
                  child: Text(
                    categoryName,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
