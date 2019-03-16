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
    return Column(
      children: <Widget>[

        //CheckBoxGroup
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
          onChange: (bool isChecked, String label, int i){
            print("isChecked: $isChecked   label: $label  i: $i");
          },
          onSelected: (List<String> checked){
            print("checked: ${checked.toString()}");
          },
        ),


        //RadioButtonGroup
        RadioButtonGroup(
          labels: [
            "Option 1",
            "Option 2",
          ],
          onChange: (int i, String l){},
          onSelected: (String label){},
        ),


      ]
    );
  }

}
