// ignore_for_file: avoid_print

import 'dart:io';

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
  }

  for (final String e in _contentList) {
    final Uri dirPath = Uri.directory('${_originalDirPath.path}/$e');
    final Directory dir = Directory.fromUri(dirPath);

    dir.listSync().map((f) {
      if (f is File) {
        f.copySync(_parsedDir.path);
      }
    });
  }

  print('End Copy Icons');
}
