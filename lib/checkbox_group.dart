/*
Name: Akshath Jain
Date: 3/15/19
Purpose: define the CheckboxGroup object
*/

part of 'grouped_buttons.dart';

class CheckboxGroup extends StatefulWidget {
  final List<String> labels;
  final void Function(bool isChecked, String label, int index) onChange;
  final void Function(List<String> selected) onSelected;
  final TextStyle labelStyle;
  final GroupedButtonsOrientation orientation;
  final Widget Function(Checkbox checkBox, Text label, int index) itemBuilder;

  //these are fields for the checkbox
  final Color activeColor;
  final Color checkColor;
  final bool tristate;

  //spacing stuff
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  CheckboxGroup({
    Key key,
    @required this.labels,
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
  Widget build(BuildContext context) {
    
    List<Widget> content = [];

    for(int i = 0; i < widget.labels.length; i++){

      Checkbox cb = Checkbox(
                      value: _selected.contains(widget.labels.elementAt(i)),
                      onChanged: (bool isChecked) => onChanged(isChecked, i),
                      checkColor: widget.checkColor,
                      activeColor: widget.activeColor ?? Theme.of(context).toggleableActiveColor,
                      tristate: widget.tristate,
                    );
      
      Text t = Text(widget.labels.elementAt(i), style: widget.labelStyle,);



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