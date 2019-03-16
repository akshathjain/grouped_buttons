/*
Name: Akshath Jain
Date: 3/15/19
Purpose: define the RadioButtonGroup object
*/

part of 'grouped_buttons.dart';

class RadioButtonGroup extends StatefulWidget {
  final List<String> labels;
  final void Function(int index, String label) onChange;
  final void Function(String selected) onSelected;

  RadioButtonGroup({
    Key key,
    this.labels,
    this.onChange,
    this.onSelected,
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
      content.add(Row(
        children: <Widget>[

          Radio(
            groupValue: widget.labels.indexOf(_selected),
            value: i,

            //just changed the selected filter to current selection
            //since these are radio buttons, and you can only pick 
            //one at a time
            onChanged: (int index) => setState((){ 
              _selected = widget.labels.elementAt(i);
              widget.onChange(i, widget.labels.elementAt(i));
              widget.onSelected(widget.labels.elementAt(i));
            }),
          ),

          SizedBox(width: 12.0,),

          Text(widget.labels.elementAt(i)),

        ]
      ));
    }

    return Container(
      margin: const EdgeInsets.all(12.0),
      child: Column(
        children: content,
      ),
    );
  }
}