import 'dart:ui';

import 'package:random_color_generator/services/color_generator/color_generator.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Generates the correct series of colors given a seed',
    () {
      const int seed = 1;
      final ColorGenerator colorGenerator = ColorGenerator(seed: seed);
      const int generatedColorsCount = 3;
      const List<Color> expectedColors = [
        Color(0xFFA473FF),
        Color(0xFF7BB3CD),
        Color(0xFFC899A0),
      ];
      final List<Color> actualColors = [];

      for (int i = 0; i < generatedColorsCount; i++) {
        actualColors.add(colorGenerator.generateColor());
      }

      expect(actualColors, equals(expectedColors));
    },
  );

  test(
    'Generates the correct series of colors when no seed is provided',
    () {
      final ColorGenerator colorGenerator = ColorGenerator();
      const int generatedColorsCount = 3;
      const List<Color> expectedColors = [
        Color(0xFF8F011C),
        Color(0xFFB37EC7),
        Color(0xFF5E0999),
      ];
      final List<Color> actualColors = [];

      for (int i = 0; i < generatedColorsCount; i++) {
        actualColors.add(colorGenerator.generateColor());
      }

      expect(actualColors, equals(expectedColors));
    },
  );
}
