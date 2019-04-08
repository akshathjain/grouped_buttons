/*
Name: Akshath Jain
Date: 3/15/19
Purpose: define the CheckboxGroup object
Copyright: © 2019, Akshath Jain. All rights reserved.
Licensing: More information can be found here: https://github.com/akshathjain/grouped_buttons/blob/master/LICENSE
*/

import 'package:flutter/material.dart';
import 'grouped_buttons_orientation.dart';

class CheckboxGroup extends StatefulWidget {
  /// A list of strings that describes each Checkbox. Each label must be distinct.
  final List<String> labels;

  /// Specifies which boxes to be automatically check.
  /// Every element must match a label.
  /// This is useful for clearing all selections (set it to []).
  /// If this is non-null, then the user must handle updating this list; otherwise, the state of the CheckboxGroup won't change.
  final List<String> checked;

  /// Specifies which boxes should be disabled.
  /// If this is non-null, no boxes will be disabled.
  /// The strings passed to this must match the labels.
  final List<String> disabled;

  /// Called when the value of the CheckboxGroup changes.
  final void Function(bool isChecked, String label, int index) onChange;

  /// Called when the user makes a selection.
  final void Function(List<String> selected) onSelected;

  /// The style to use for the labels.
  final TextStyle labelStyle;

  /// Specifies the orientation to display elements.
  final GroupedButtonsOrientation orientation;

  /// Called when needed to build a CheckboxGroup element.
  final Widget Function(Checkbox checkBox, Text label, int index) itemBuilder;

  //THESE FIELDS ARE FOR THE CHECKBOX

  /// The color to use when a Checkbox is checked.
  final Color activeColor;

  /// The color to use for the check icon when a Checkbox is checked.
  final Color checkColor;

  /// If true the checkbox's value can be true, false, or null.
  final bool tristate;


  //SPACING STUFF

  /// Empty space in which to inset the CheckboxGroup.
  final EdgeInsetsGeometry padding;

  /// Empty space surrounding the CheckboxGroup.
  final EdgeInsetsGeometry margin;

  CheckboxGroup({
    Key key,
    @required this.labels,
    this.checked,
    this.disabled,
    this.onChange,
    this.onSelected,
    this.labelStyle = const TextStyle(),
    this.activeColor, //defaults to toggleableActiveColor,
    this.checkColor = const Color(0xFFFFFFFF),
    this.tristate = false,
    this.orientation = GroupedButtonsOrientation.VERTICAL,
    this.itemBuilder,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
  }) : super(key: key);


  @override
  _CheckboxGroupState createState() => _CheckboxGroupState();
}



class _CheckboxGroupState extends State<CheckboxGroup> {
  List<String> _selected = [];

  @override
  void initState(){
    super.initState();

    //set the selected to the checked (if not null)
    _selected = widget.checked ?? [];

  }

  @override
  Widget build(BuildContext context) {

    //set the selected to the checked (if not null)
    if(widget.checked != null){
      _selected = [];
     _selected.addAll(widget.checked); //use add all to prevent a shallow copy
    }


    List<Widget> content = [];

    for(int i = 0; i < widget.labels.length; i++){

      Checkbox cb = Checkbox(
                      value: _selected.contains(widget.labels.elementAt(i)),
                      onChanged: (widget.disabled != null && widget.disabled.contains(widget.labels.elementAt(i))) ? null :
                                    (bool isChecked) => onChanged(isChecked, i),
                      checkColor: widget.checkColor,
                      activeColor: widget.activeColor ?? Theme.of(context).toggleableActiveColor,
                      tristate: widget.tristate,
                    );

      Text t = Text(
        widget.labels.elementAt(i),
        style: (widget.disabled != null && widget.disabled.contains(widget.labels.elementAt(i))) ?
                  widget.labelStyle.apply(color: Theme.of(context).disabledColor) :
                  widget.labelStyle
      );



      //use user defined method to build
      if(widget.itemBuilder != null)
        content.add(widget.itemBuilder(cb, t, i));
      else{ //otherwise, use predefined method of building

        //vertical orientation means Column with Row inside
        if(widget.orientation == GroupedButtonsOrientation.VERTICAL){

          content.add(Row(children: <Widget>[
            SizedBox(width: 12.0),
            cb,
            SizedBox(width: 12.0),
            t,
          ]));

        }else{ //horizontal orientation means Row with Column inside

          content.add(Column(children: <Widget>[
            cb,
            SizedBox(width: 12.0),
            t,
          ]));

        }

      }
    }

    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: widget.orientation == GroupedButtonsOrientation.VERTICAL ? Column(children: content) : Row(children: content),
    );
  }


  void onChanged(bool isChecked, int i){
    bool isAlreadyContained = _selected.contains(widget.labels.elementAt(i));

    if(mounted){
      setState(() {
        if(!isChecked && isAlreadyContained){
          _selected.remove(widget.labels.elementAt(i));
        }else if(isChecked && !isAlreadyContained){
          _selected.add(widget.labels.elementAt(i));
        }

        if(widget.onChange != null) widget.onChange(isChecked, widget.labels.elementAt(i), i);
        if(widget.onSelected != null) widget.onSelected(_selected);
      });
    }
  }

}