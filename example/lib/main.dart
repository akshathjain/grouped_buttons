/*
Name: Akshath Jain
Date: 3/15/19
Purpose: example app for the grouped buttons package
*/

import 'package:flutter/material.dart';

void main() => runApp(GroupedButtonExample());

class GroupedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
    return Container();
  }

}
