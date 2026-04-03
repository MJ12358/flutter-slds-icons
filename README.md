# Flutter SLDS Icons

![pub package](https://img.shields.io/pub/v/flutter_slds_icons)

[Salesforce Lightning Design System](https://www.lightningdesignsystem.com/icons/) Icons for Flutter!

## Documentation

### The original icons
  
- [Download Icons](https://v1.lightningdesignsystem.com/assets/downloads/salesforce-lightning-design-system-icons.zip)

### The generator

- [FlutterIcon](https://fluttericon.com/)

### The output

- [SLDSIcons](https://pub.dev/documentation/flutter_slds_icons/latest/flutter_slds_icons/SLDSIcons-class.html)

## Usage

```dart
import 'package:flutter_slds_icons/flutter_slds_icons.dart';

Icon(SLDSIcons.account);
```

## Legal

Used under the [Creative Commons Attribution-NoDerivatives 4.0 International Public License](https://creativecommons.org/licenses/by-nd/4.0/legalcode).

Salesforce has not reviewed, approved, or endorsed this project.

### Instructions for Maintainers

- Download the original icons from the Salesforce link above.
- Unzip them into the `assets/original` folder.
- Create the 'parsed' icons using `dart run scripts/generate_icons.dart`.

- Using `FlutterIcon`, drag and drop all the 'parsed' icons into the site.
- Change the class name from `MyFlutterApp` to `SLDSIcons`.
- Drag to select all icons and click the Download button.
- Unzip the output and move/rename `s_l_d_s_icons_icons.dart` to `lib/src/slds_icons.dart`.
- Change `_kFontPkg` to `flutter_slds_icons`.
- Move the output `fonts/SLDSIcons.ttf` to `lib/assets/SLDSIcons.ttf`.

- Create the test icon map using `dart run scripts/generate_test_map.dart`.
