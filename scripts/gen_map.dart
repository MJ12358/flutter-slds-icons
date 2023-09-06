// ignore_for_file: avoid_print

import 'dart:io';

import 'common.dart';

final Uri _dirPath = Platform.script.resolve('../assets/parsed');
final Uri _filePath = Platform.script.resolve('../example/lib/map.dart');
final Directory _dir = Directory.fromUri(_dirPath);
final File _file = File.fromUri(_filePath);

void main() {
  print('Begin Gen Map');

  if (!_dir.existsSync()) {
    print('Assets do not exist, please run "copy_icons" and try again.');
    exit(1);
  }

  final Map<String, String> map = <String, String>{};

  for (final FileSystemEntity f in _dir.listSync(followLinks: false)) {
    if (f is! File) {
      continue;
    }

    final String displayName = f.displayName;

    if (kReservedWords.contains(displayName)) {
      continue;
    }

    map['\'$displayName\''] = 'SLDSIcons.$displayName';
  }

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
