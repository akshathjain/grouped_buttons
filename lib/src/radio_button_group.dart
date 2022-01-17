/*
Name: Akshath Jain
Date: 3/15/19
Purpose: define the RadioButtonGroup object
Copyright: © 2019, Akshath Jain. All rights reserved.
Licensing: More information can be found here: https://github.com/akshathjain/grouped_buttons/blob/master/LICENSE
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'grouped_buttons_orientation.dart';

class RadioButtonGroup extends StatefulWidget {
  /// A list of strings that describes each Radio button. Each label must be distinct.
  final List<String> labels;

  /// Specifies which Radio button to automatically pick.
  /// Every element must match a label.
  /// This is useful for clearing what is picked (set it to "").
  /// If this is non-null, then the user must handle updating this; otherwise, the state of the RadioButtonGroup won't change.
  final String picked;

  /// Specifies which buttons should be disabled.
  /// If this is non-null, no buttons will be disabled.
  /// The strings passed to this must match the labels.
  final List<String> disabled;

  /// Called when the value of the RadioButtonGroup changes.
  final void Function(String label, int index) onChange;

  /// Called when the user makes a selection.
  final void Function(String selected) onSelected;

  /// The style to use for the labels.
  final TextStyle labelStyle;

  /// Specifies the orientation to display elements.
  final GroupedButtonsOrientation orientation;

  /// Called when needed to build a RadioButtonGroup element.
  final Widget Function(Radio radioButton, GestureDetector label, int index)
      itemBuilder;

  //RADIO BUTTON FIELDS
  /// The color to use when a Radio button is checked.
  final Color activeColor;

  //SPACING STUFF
  /// Empty space in which to inset the RadioButtonGroup.
  final EdgeInsetsGeometry padding;

  /// Empty space surrounding the RadioButtonGroup.
  final EdgeInsetsGeometry margin;

  /// Size of radio for the RadioButtonGroup.
  final double size;

  RadioButtonGroup({
    Key key,
    @required this.labels,
    this.picked,
    this.disabled,
    this.onChange,
    this.onSelected,
    this.labelStyle = const TextStyle(),
    this.activeColor, //defaults to toggleableActiveColor,
    this.orientation = GroupedButtonsOrientation.VERTICAL,
    this.itemBuilder,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.size,
  }) : super(key: key);

  @override
  _RadioButtonGroupState createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  List<String> _labels = [];
  List<String> _disabled = [];
  String _selected;
  double _size;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void didUpdateWidget(RadioButtonGroup oldWidget) {
    if (widget != oldWidget) {
      _init();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    _selected = widget.picked ?? _selected;
    _size = widget.size ?? 1;

    List<Widget> content = [];
    for (int i = 0; i < _labels.length; i++) {
      Widget rb = SizedBox(
        height: 48.0 * _size,
        width: 48.0 * _size,
        child: Transform.scale(
          scale: _size,
          child: Radio(
            activeColor:
                widget.activeColor ?? Theme.of(context).toggleableActiveColor,
            groupValue: _labels.indexOf(_selected),
            value: i,

            //just changed the selected filter to current selection
            //since these are radio buttons, and you can only pick
            //one at a time
            onChanged:
                (_disabled != null && _disabled.contains(_labels.elementAt(i)))
                    ? null
                    : (var index) => setState(() {
                          _selected = _labels.elementAt(i);

                          if (widget.onChange != null)
                            widget.onChange(_labels.elementAt(i), i);
                          if (widget.onSelected != null)
                            widget.onSelected(_labels.elementAt(i));
                        }),
          ),
        ),
      );

      GestureDetector t = GestureDetector(
          onTap: () => setState(() {
                _selected = _labels.elementAt(i);
                if (widget.onChange != null)
                  widget.onChange(_labels.elementAt(i), i);
                if (widget.onSelected != null)
                  widget.onSelected(_labels.elementAt(i));
              }),
          child: Text(_labels.elementAt(i),
              style: (_disabled != null &&
                      _disabled.contains(_labels.elementAt(i)))
                  ? widget.labelStyle
                      .apply(color: Theme.of(context).disabledColor)
                  : widget.labelStyle));

      //use user defined method to build
      if (widget.itemBuilder != null)
        content.add(widget.itemBuilder(rb, t, i));
      else {
        //otherwise, use predefined method of building

        //vertical orientation means Column with Row inside
        if (widget.orientation == GroupedButtonsOrientation.VERTICAL) {
          content.add(Row(children: <Widget>[
            SizedBox(width: 12.0 * _size),
            rb,
            SizedBox(width: 12.0 * _size),
            Expanded(child: t),
          ]));
        } else {
          //horizontal orientation means Row with Column inside

          content.add(Column(children: <Widget>[
            SizedBox(height: 12.0 * _size),
            rb,
            SizedBox(height: 12.0 * _size),
            Expanded(child: t),
          ]));
        }
      }
    }

    return Container(
      padding: widget.padding * _size,
      margin: widget.margin * _size,
      child: widget.orientation == GroupedButtonsOrientation.VERTICAL
          ? Column(children: content)
          : Row(children: content),
    );
  }

  void _init() {
    _labels = widget.labels;
    _disabled = widget.disabled;
    _selected = widget.picked ?? "";
    _size = widget.size ?? 1;
  }
}
