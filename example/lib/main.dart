/*
Name: Akshath Jain
Date: 3/15/19
Purpose: example app for the grouped buttons package
*/

import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

void main() => runApp(GroupedButtonExample());

class GroupedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grouped Buttons Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  

  List<String> _customCheckboxGroupChecked = ["A", "B"];
  String _customRadioButtonGroupPicked = "Two";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Grouped Buttons Example"),
      ),
      body: _body(),
    );
    // 
  }

  Widget _body(){
    return ListView(
      children: <Widget>[

        //--------------------
        //SIMPLE USAGE EXAMPLE
        //--------------------

        //BASIC CHECKBOXGROUP
        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
          child: Text("Basic CheckboxGroup", 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20.0
            ),
          ),
        ),

        CheckboxGroup(
          labels: <String>[
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday",
          ],
          onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
          onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
        ),



        //BASIC RADIOBUTTONGROUP
        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
          child: Text("Basic RadioButtonGroup", 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20.0
            ),
          ),
        ),
        
        RadioButtonGroup(
          labels: [
            "Option 1",
            "Option 2",
          ],
          onChange: (String label, int index) => print("label: $label index: $index"),
          onSelected: (String label) => print(label),
        ),




        //--------------------
        //CUSTOM USAGE EXAMPLE
        //--------------------

        ///CUSTOM CHECKBOX GROUP
        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
          child: Text("Custom CheckboxGroup", 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20.0
            ),
          ),
        ),

        CheckboxGroup(
          orientation: GroupedButtonsOrientation.HORIZONTAL,
          margin: const EdgeInsets.only(left: 12.0),
          onSelected: (List selected) => setState((){
            _customCheckboxGroupChecked = selected;
          }),
          labels: <String>[
            "A",
            "B",
          ],
          checked: _customCheckboxGroupChecked,
          itemBuilder: (Checkbox cb, Text txt, int i){
            return Column(
              children: <Widget>[
                Icon(Icons.polymer),
                cb,
                txt,
              ],
            );
          },
        ),
        


        ///CUSTOM RADIOBUTTON GROUP
        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
          child: Text("Custom RadioButtonGroup", 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20.0
            ),
          ),
        ),

        RadioButtonGroup(
          orientation: GroupedButtonsOrientation.HORIZONTAL,
          margin: const EdgeInsets.only(left: 12.0),
          onSelected: (String selected) => setState((){
            _customRadioButtonGroupPicked = selected;
          }),
          labels: <String>[
            "One",
            "Two",
          ],
          picked: _customRadioButtonGroupPicked,
          itemBuilder: (Radio rb, Text txt, int i){
            return Column(
              children: <Widget>[
                Icon(Icons.public),
                rb,
                txt,
              ],
            );
          },
        ),
  
      ]
    );
  }

}
