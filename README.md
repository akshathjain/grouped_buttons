# Grouped Buttons
[![pub package](https://img.shields.io/pub/v/grouped_buttons.svg)](https://pub.dartlang.org/packages/grouped_buttons)

A set of Flutter widgets that makes grouping Checkboxes and Radio Buttons much easier!

## Installing

Add the following to your `pubspec.yaml` file:

    dependencies:
      grouped_buttons: ^0.0.1
      
## Simple Usage
#### Creating a basic CheckboxGroup

    CheckboxGroup(
      labels: <String>[
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday",
      ],
      onSelected: (List<String> checked) => print(checked.toString())
    );
    
#### Creating a basic RadioButtonGroup

    RadioButtonGroup(
      labels: <String>[
        "Option 1",
        "Option 2",
      ],
      onSelected: (String selected) => print(selected)
    );

#### Screenshot