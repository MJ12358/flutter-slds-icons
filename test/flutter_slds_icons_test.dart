import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: avoid_relative_lib_imports
import '../example/lib/map.dart';

void main() {
  test('verify icons', () {
    // This test is to ensure that the icons are correctly defined.
    // It checks if all icons in the map are valid IconData instances.
    expect(kIcons.isNotEmpty, true);
    for (final MapEntry<String, IconData> entry in kIcons.entries) {
      expect(entry.value, isA<IconData>());
      expect(entry.key.isNotEmpty, true);
    }
  });
}
