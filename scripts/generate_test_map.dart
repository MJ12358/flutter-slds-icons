import 'dart:io';

import 'common.dart';

/// This script generates a Dart map of icon names to their
/// corresponding IconData by reading the parsed assets
/// directory and writing the output to a Dart file in the
/// example lib directory.
/// It validates the source directory, collects valid
/// icons, generates the Dart map content,
/// and handles errors appropriately.
void main() {
  final Directory sourceDir = Directory.fromUri(
    Platform.script.resolve('../assets/parsed'),
  );

  final File outputFile = File.fromUri(
    Platform.script.resolve('../example/lib/map.dart'),
  );

  stdout.writeln('Begin Gen Map');

  run(sourceDir, outputFile);

  stdout.writeln('End Gen Map');
}

/// Runs the map generation process by validating the source directory,
/// collecting icons, generating the Dart map content,
/// and writing it to the output file.
void run(Directory dir, File outputFile) {
  _validateSource(dir);

  final Map<String, String> icons = _collectIcons(dir);

  if (icons.isEmpty) {
    _fail('No assets found in directory.');
  }

  final String content = _generateDartMap(icons);

  outputFile.writeAsStringSync(content);
}

/// Validates that the source directory exists and contains valid files.
void _validateSource(Directory dir) {
  if (!dir.existsSync()) {
    _fail('Assets do not exist, please run "copy_icons" and try again.');
  }
}

/// Collects valid icons from the directory and returns a map
/// of their names to their corresponding IconData.
Map<String, String> _collectIcons(Directory dir) {
  final Map<String, String> result = <String, String>{};

  for (final FileSystemEntity entity in dir.listSync(followLinks: false)) {
    if (!_isValidFile(entity)) {
      continue;
    }

    final File file = entity as File;
    final String name = file.displayName;

    result[name] = 'SLDSIcons.$name';
  }

  return result;
}

/// Determines if the given file system entity is a valid file
/// that should be included in the map.
bool _isValidFile(FileSystemEntity entity) {
  if (entity is! File) {
    return false;
  }

  return !kReservedWords.contains(entity.displayName);
}

/// Generates a Dart map as a string from the given icons map.
String _generateDartMap(Map<String, String> icons) {
  final StringBuffer buffer = StringBuffer()
    ..writeln("import 'package:flutter/material.dart';")
    ..writeln("import 'package:flutter_slds_icons/flutter_slds_icons.dart';")
    ..writeln()
    ..writeln('const Map<String, IconData> kIcons = {');

  final List<String> sortedKeys = icons.keys.toList()..sort();

  for (final String key in sortedKeys) {
    buffer.writeln("  '$key': ${icons[key]},");
  }

  buffer.writeln('};');

  return buffer.toString();
}

/// Prints the given error message to stderr and exits
/// the program with a non-zero code.
Never _fail(String message) {
  stderr.writeln(message);
  exit(1);
}
