import 'dart:io';

final List<String> kReservedWords = <String>[
  'case',
  'default',
  'new',
  'switch',
  'sync',
  'filterList', // this one needs to get re-generated
];

extension FileExtension on File {
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

  String get extension {
    final int dot = path.lastIndexOf('.');
    if (dot < 0 || dot + 1 >= path.length) {
      return '';
    }
    return path.substring(dot + 1).toLowerCase();
  }
}
