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

        //Basic CheckboxGroup
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
          onChange: (bool isChecked, String label, int i) => print("isChecked: $isChecked   label: $label  i: $i"),
          onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
        ),



        //Basic RadioButtonGroup
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
          onChange: (int i, String l) => print("$i $l"),
          onSelected: (String label) => print(label),
        ),


      ]
    );
  }

}
