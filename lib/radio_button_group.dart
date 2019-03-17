/*
Name: Akshath Jain
Date: 3/15/19
Purpose: define the RadioButtonGroup object
*/

part of 'grouped_buttons.dart';

class RadioButtonGroup extends StatefulWidget {
  final List<String> labels;
  final void Function(String label, int index) onChange;
  final void Function(String selected) onSelected;
  final TextStyle labelStyle;
  final GroupedButtonsOrientation orientation;
  final Widget Function(Radio radioButton, Text label, int index) itemBuilder;

  //fields for the radiobutton
  final Color activeColor;

  //spacing stuff
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  RadioButtonGroup({
    Key key,
    @required this.labels,
    this.onChange,
    this.onSelected,
    this.labelStyle = const TextStyle(),
    this.activeColor, //defaults to toggleableActiveColor,
    this.orientation = GroupedButtonsOrientation.VERTICAL,
    this.itemBuilder,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
  }) : super (key: key);

  @override
  _RadioButtonGroupState createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  String _selected;

  @override
  Widget build(BuildContext context) {

    List<Widget> content = [];
    for(int i = 0; i < widget.labels.length; i++){

      Radio rb = Radio(
                  activeColor: widget.activeColor ?? Theme.of(context).toggleableActiveColor,
                  groupValue: widget.labels.indexOf(_selected),
                  value: i,

                  //just changed the selected filter to current selection
                  //since these are radio buttons, and you can only pick 
                  //one at a time
                  onChanged: (var index) => setState((){ 
                    _selected = widget.labels.elementAt(i);
                    
                    if(widget.onChange != null) widget.onChange(widget.labels.elementAt(i), i);
                    if(widget.onSelected != null) widget.onSelected(widget.labels.elementAt(i));
                  }),
                );

      Text t = Text(widget.labels.elementAt(i), style: widget.labelStyle);

      //use user defined method to build
      if(widget.itemBuilder != null)
        content.add(widget.itemBuilder(rb, t, i));
      else{ //otherwise, use predefined method of building
        
        //vertical orientation means Column with Row inside
        if(widget.orientation == GroupedButtonsOrientation.VERTICAL){
         
          content.add(Row(children: <Widget>[
            SizedBox(width: 12.0),
            rb,
            SizedBox(width: 12.0),
            t,
          ]));

        }else{ //horizontal orientation means Row with Column inside
          
          content.add(Column(children: <Widget>[
            rb,
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
}