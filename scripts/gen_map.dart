// ignore_for_file: avoid_print

import 'dart:io';

final Uri _dirPath = Platform.script.resolve('../assets/parsed');
final Uri _filePath = Platform.script.resolve('../example/lib/map.dart');
final Directory _dir = Directory.fromUri(_dirPath);
final File _file = File.fromUri(_filePath);
final List<String> _reservedWords = <String>[
  'case',
  'default',
  'new',
  'switch',
  'sync',
  'filterList',
];

void main() {
  print('Begin Gen Map');

  if (!_dir.existsSync()) {
    print('Assets do not exist, please run "copy_icons" and try again.');
    exit(1);
  }

  final Map<String, String> map = <String, String>{};

  _dir.listSync(followLinks: false).forEach((f) {
    if (f is File) {
      final String displayName = f.displayName;
      if (!_reservedWords.contains(displayName)) {
        map['\'$displayName\''] = 'SLDSIcons.$displayName';
      }
    }
  });

  if (map.isEmpty) {
    print('No assets found in directory, please check and try again.');
    exit(1);
  }

  String result = "import 'package:flutter/material.dart';\n"
      "import 'package:flutter_slds_icons/flutter_slds_icons.dart';\n\n";

  result += 'Map<String, IconData> kIcons = <String, IconData>$map;';

  _file.writeAsStringSync(result);

  print('End Gen Map');
}

extension on File {
  String get name {
    final String separator = Platform.pathSeparator;
    final List<String> split = path.split(separator);
    if (split.isEmpty) {
      return '';
    }
    return split.last;
  }

  String get displayName {
    final String name = this.name;
    final int dot = name.lastIndexOf('.');
    if (dot < 0 || dot + 1 >= name.length) {
      return name;
    }
    return name.substring(0, dot);
  }
}
