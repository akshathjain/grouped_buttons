# grouped_buttons
[![pub package](https://img.shields.io/pub/v/grouped_buttons.svg)](https://pub.dartlang.org/packages/grouped_buttons)

A set of Flutter widgets that makes grouping Checkboxes and Radio Buttons much easier!

## Installing

Add the following to your `pubspec.yaml` file:

    dependencies:
      grouped_buttons: ^1.0.0
      
## Simple Usage
#### Creating a basic `CheckboxGroup`

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
    
#### Creating a basic `RadioButtonGroup`

    RadioButtonGroup(
      labels: <String>[
        "Option 1",
        "Option 2",
      ],
      onSelected: (String selected) => print(selected)
    );

#### Screenshot
<img width="250px" src="https://raw.githubusercontent.com/akshathjain/grouped_buttons/master/screenshots/basicusagescreenshot.png" alt="Basic Usage"/>

## Custom Usage
There are several options that allow for more control.

#### Custom `CheckboxGroup`
|   Properties  |  Description |
|---------------|--------------|
|`activeColor`  |The color to use when a Checkbox is checked.  |
|`checkColor`   |The color to use for the check icon when a Checkbox is checked.   |
|`itemBuilder`  |Called when needed to build a CheckboxGroup element.   |
|`labels`       |(required) A list of strings that describes each Checkbox.   |
|`labelStyle`   |The style to use for the labels.   |
|`margin`       |Empty space surrounding the CheckboxGroup.   |
|`onChange`     |Called when the value of the CheckboxGroup changes   |
|`onSelected`   |Called when the user makes a selection   |
|`orientation`  |Specifies the orientation to display elements. Either `GroupedButtonsOrientation.HORIZONTAL` or `GroupedButtonsOrientation.VERTICAL`.  |
|`padding`      |Empty space in which to inset the CheckboxGroup.   |
|`tristate`     |If true the checkbox's value can be true, false, or null.   |

    CheckboxGroup(
      orientation: GroupedButtonsOrientation.HORIZONTAL,
      margin: const EdgeInsets.only(left: 12.0),
      onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
      onSelected: (List selected) => print(selected.toString()),
      labels: <String>[
        "A",
        "B",
      ],
      itemBuilder: (Checkbox cb, Text txt, int i){
        return Column(
          children: <Widget>[
            Icon(Icons.polymer),
            cb,
            txt,
          ],
        );
      },
    );

#### Custom `RadioButtonGroup`
|   Properties  |  Description |
|---------------|--------------|
|`activeColor`  |The color to use when a Radio button is checked.  |
|`itemBuilder`  |Called when needed to build a RadioButtonGroup element.   |
|`labels`       |(required) A list of strings that describes each Radio button.   |
|`labelStyle`   |The style to use for the labels.   |
|`margin`       |Empty space surrounding the RadioButtonGroup.   |
|`onChange`     |Called when the value of the RadioButtonGroup changes   |
|`onSelected`   |Called when the user makes a selection   |
|`orientation`  |Specifies the orientation to display elements. Either `GroupedButtonsOrientation.HORIZONTAL` or `GroupedButtonsOrientation.VERTICAL`.  |
|`padding`      |Empty space in which to inset the RadioButtonGroup.   |

    RadioButtonGroup(
      orientation: GroupedButtonsOrientation.HORIZONTAL,
      margin: const EdgeInsets.only(left: 12.0),
      onChange: (String label, int index) => print("label: $label index: $index"),
      onSelected: (String selected) => print(selected),
      labels: <String>[
        "One",
        "Two",
      ],
      itemBuilder: (Radio rb, Text txt, int i){
        return Column(
          children: <Widget>[
            Icon(Icons.public),
            rb,
            txt,
          ],
        );
      },
    );

#### Screenshot
<img width="250px" src="https://raw.githubusercontent.com/akshathjain/grouped_buttons/master/screenshots/customusagescreenshot.png" alt="Basic Usage"/>
