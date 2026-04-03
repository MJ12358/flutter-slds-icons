import 'dart:io';

import 'common.dart';

/// This script copies SVG icon files from the original assets directory
/// to a parsed assets directory, filtering out any reserved words and
/// non-SVG files. It validates the source directory, prepares the target
/// directory, processes each category of icons,
/// and handles errors appropriately.
void main() {
  final Directory sourceDir = Directory.fromUri(
    Platform.script.resolve('../assets/original'),
  );

  final Directory outputDir = Directory.fromUri(
    Platform.script.resolve('../assets/parsed'),
  );

  const List<String> categories = <String>[
    'action',
    'custom',
    'doctype',
    'standard',
    'utility',
  ];

  stdout.writeln('Begin Copy Icons');

  _validateSource(sourceDir);
  _prepareTarget(outputDir);

  for (final String category in categories) {
    _processCategory(category, sourceDir, outputDir);
  }

  stdout.writeln('End Copy Icons');
}

/// Validates that the source directory exists.
void _validateSource(Directory dir) {
  if (!dir.existsSync()) {
    stdout.writeln('Original assets do not exist.');
    exit(1);
  }
}

/// Prepares the target directory by deleting it
/// if it exists and creating a new one.
void _prepareTarget(Directory dir) {
  if (dir.existsSync()) {
    dir.deleteSync(recursive: true);
  }
  dir.createSync(recursive: true);
}

/// Processes a category by copying valid files
/// from the source directory to the target directory.
void _processCategory(
  String category,
  Directory sourceDir,
  Directory outputDir,
) {
  stdout.writeln(category);

  final Directory dir = Directory.fromUri(
    sourceDir.uri.resolve('$category/'),
  );

  if (!dir.existsSync()) {
    stdout.writeln('Skipping missing directory: $category');
    return;
  }

  for (final FileSystemEntity entity in dir.listSync(followLinks: false)) {
    if (!_isValidFile(entity)) {
      continue;
    }

    final File file = entity as File;
    _copyFile(file, outputDir);
  }
}

/// Checks if the given file system entity is a valid file to be copied.
bool _isValidFile(FileSystemEntity entity) {
  if (entity is! File) {
    return false;
  }

  return !kReservedWords.contains(entity.displayName) &&
      entity.extension == 'svg';
}

/// Copies the given file to the target directory.
void _copyFile(File file, Directory targetDir) {
  final Uri targetUri = targetDir.uri.resolve(file.name);
  file.copySync(targetUri.toFilePath());
}
