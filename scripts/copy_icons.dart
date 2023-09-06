// ignore_for_file: avoid_print

import 'dart:io';

import 'common.dart';

final Uri _originalDirPath = Platform.script.resolve('../assets/original');
final Uri _parsedDirPath = Platform.script.resolve('../assets/parsed');
final Directory _originalDir = Directory.fromUri(_originalDirPath);
final Directory _parsedDir = Directory.fromUri(_parsedDirPath);
final List<String> _contentList = <String>[
  'action',
  'custom',
  'doctype',
  'standard',
  'utility',
];

void main() {
  print('Begin Copy Icons');

  if (!_originalDir.existsSync()) {
    print('Original assets do not exist, please add and try again.');
    exit(1);
  }

  if (!_parsedDir.existsSync()) {
    _parsedDir.createSync();
  } else {
    _parsedDir.deleteSync(recursive: true);
    _parsedDir.createSync();
  }

  for (final String c in _contentList) {
    print(c);
    final Uri dirPath = Platform.script.resolve('${_originalDirPath.path}/$c');
    final Directory dir = Directory.fromUri(dirPath);

    for (final FileSystemEntity f in dir.listSync(followLinks: false)) {
      if (f is! File) {
        continue;
      }

      final String displayName = f.displayName;

      if (kReservedWords.contains(displayName)) {
        continue;
      }

      if (f.extension != 'svg') {
        continue;
      }

      final Uri filePath =
          Platform.script.resolve('${_parsedDir.path}/${f.name}');

      f.copySync(filePath.toString());
    }
  }

  print('End Copy Icons');
}
