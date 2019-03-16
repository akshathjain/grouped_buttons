/*
Name: Akshath Jain
Date: 3/15/19
Purpose: define the CheckboxGroup object
*/

part of 'grouped_buttons.dart';

class CheckboxGroup extends StatefulWidget {
  final List<String> labels;
  final Widget Function(bool isChecked, String label, int index) onChange;

  CheckboxGroup({
    Key key,
    this.labels,
    this.onChange,
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

        widget.onChange(isChecked, widget.labels.elementAt(i), i);
      });
    }
  }

}