import 'package:flutter/material.dart';

import 'package:unit_converter/widgets/unit.dart';

const _padding = EdgeInsets.all(16.0);

class ConverterScreen extends StatefulWidget {
  final categoryName;
  final categoryColor;
  final units;

  const ConverterScreen({
    @required this.categoryName,
    @required this.categoryColor,
    @required this.units,
  })  : assert(categoryName != null),
        assert(categoryColor != null),
        assert(units != null);

  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  Unit _fromValue;
  Unit _toValue;
  double _inputValue;
  String _convertedValue = '';
  List<DropdownMenuItem> _unitMenuItems;
  bool _showValidationError = false;
  var swap = TextEditingController();

  @override
  void initState() {
    super.initState();
    _createDropdownMenuItems();
    _setDefaults();
  }

  // creates the dropdown menu items
  void _createDropdownMenuItems() {
    var newItems = <DropdownMenuItem>[];
    for (var unit in widget.units) {
      newItems.add(
        DropdownMenuItem(
          value: unit.name,
          child: Container(
            child: Text(
              unit.name,
              softWrap: true,
            ),
          ),
        ),
      );
    }
    setState(() {
      _unitMenuItems = newItems;
    });
  }

// sets the default values for from and to dropdown menu
  void _setDefaults() {
    setState(() {
      _fromValue = widget.units[0];
      _toValue = widget.units[1];
    });
  }

  // updates the converted value
  void _updateConversion() {
    setState(() {
      _convertedValue =
          (_inputValue * (_toValue.conversion / _fromValue.conversion))
              .toString();
    });
  }

  // called when the input is changed
  void _updateInputValue(String input) {
    setState(() {
      if (input == null || input.isEmpty) {
        _convertedValue = '';
      } else {
        try {
          final inputDouble = double.parse(input);
          _showValidationError = false;
          _inputValue = inputDouble;
          _updateConversion();
        } on Exception catch (e) {
          print('Error: $e');
          _showValidationError = true;
        }
      }
    });
  }

  // obtasins the name of the unit
  Unit _getUnit(String unitName) {
    return widget.units.firstWhere(
      (Unit unit) {
        return unit.name == unitName;
      },
      orElse: null,
    );
  }

  // changes the dropdown and updates the values
  void _updateFromConversion(dynamic unitName) {
    setState(() {
      _fromValue = _getUnit(unitName);
    });

    if (_inputValue != null) {
      _updateConversion();
    }
  }

  // changes the dropdown and updates the values
  void _updateToConversion(dynamic unitName) {
    setState(() {
      _toValue = _getUnit(unitName);
    });

    if (_inputValue != null) {
      _updateConversion();
    }
  }
  // changes the dropdown and updates the values

  Widget _createDropdown(String currentValue, ValueChanged<dynamic> onChanged) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(
            color: widget.categoryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[50],
        ),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              isExpanded: true,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: widget.categoryColor),
              iconEnabledColor: widget.categoryColor,
              dropdownColor: Theme.of(context).scaffoldBackgroundColor,
              value: currentValue,
              items: _unitMenuItems,
              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
  }

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
          controller: swap,
          keyboardType: TextInputType.number,
          cursorColor: widget.categoryColor,
          style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 35),
          decoration: InputDecoration(
            labelText: 'Input',
            labelStyle: TextStyle(color: widget.categoryColor),
            errorText: _showValidationError ? 'Invalid number entered' : null,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: widget.categoryColor, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: widget.categoryColor, width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red, width: 1)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red, width: 1)),
          ),
          onChanged: _updateInputValue,
        ),
        _createDropdown(_fromValue.name, _updateFromConversion)
      ]),
    );

    final arrows = RotatedBox(
      quarterTurns: 1,
      child: IconButton(
        icon: Icon(
          Icons.compare_arrows,
          size: 40.0,
          color: Theme.of(context).primaryIconTheme.color,
        ),
        onPressed: () => setState(() {
          // var temp = swap.text;
          swap.text = _convertedValue;
          // _convertedValue = temp;
          _updateInputValue(_convertedValue);
        }),
      ),
    );

    final output = Padding(
      padding: _padding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        InputDecorator(
          child: Text(
            _convertedValue,
            style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 35),
          ),
          decoration: InputDecoration(
            labelText: 'Output',
            labelStyle: TextStyle(color: widget.categoryColor)
                .copyWith(fontSize: 35, fontWeight: FontWeight.bold),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: widget.categoryColor, width: 1)),
          ),
        ),
        _createDropdown(_toValue.name, _updateToConversion)
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
            children: [input, arrows, output],
          ),
        ),
      ),
    );
  }
}
