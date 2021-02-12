import 'package:flutter/material.dart';

const _padding = EdgeInsets.all(16.0);

class ConverterScreen extends StatefulWidget {
  final categoryName;
  final categoryColor;
  final units;

  const ConverterScreen(this.categoryName, this.categoryColor, this.units);

  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  String _value1;
  String _value2;
  List<String> units;

  @override
  void initState() {
    super.initState();
    units = widget.units;
    _value1 = units[0];
    _value2 = units[1];
  }

  Widget _createDropdown(String currentValue) {
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
          child: DropdownButton(
            isExpanded: true,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: widget.categoryColor),
            iconEnabledColor: widget.categoryColor,
            dropdownColor: Theme.of(context).scaffoldBackgroundColor,
            value: currentValue,
            items: units.map(
              (item) {
                return DropdownMenuItem(
                  value: item,
                  child: new Text(item),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                currentValue = value;
              });
            },
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
        _createDropdown(_value1)
      ]),
    );

    final arrows = RotatedBox(
      quarterTurns: 1,
      child: Icon(
        Icons.compare_arrows,
        size: 40.0,
        color: Theme.of(context).primaryIconTheme.color,
      ),
    );

    final output = Padding(
      padding: _padding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        TextField(
          keyboardType: TextInputType.number,
          cursorColor: widget.categoryColor,
          style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 35),
          decoration: InputDecoration(
            labelText: 'Output',
            labelStyle: TextStyle(color: widget.categoryColor),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: widget.categoryColor, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: widget.categoryColor, width: 1)),
          ),
        ),
        _createDropdown(_value2)
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
