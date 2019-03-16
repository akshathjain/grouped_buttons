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

  CheckboxGroup({
    Key key,
    @required this.labels,
    this.onChange,
    this.onSelected,
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
      content.add(Row(children: <Widget>[
        Checkbox(
          value: _selected.contains(widget.labels.elementAt(i)),
          onChanged: (bool isChecked) => onChanged(isChecked, i),
        ),

        SizedBox(width: 24.0),

        Text(widget.labels.elementAt(i))
      ]));
    }

    return Container(
      child: Column(
        children: content,
      ),
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