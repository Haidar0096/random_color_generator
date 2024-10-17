import 'dart:math';
import 'dart:ui';

/// Generator for random colors.
class ColorGenerator {
  final Random _random;

  /// The maximum value for each color component (Red, Green, Blue).
  static const int maxColorValue = 255;

  /// The default seed for the random number generator.
  static const int defaultSeed = 0;

  /// Creates a [ColorGenerator] with the provided seed.
  ///
  /// The [seed] parameter allows for reproducible color generation.
  ColorGenerator({int seed = defaultSeed}) : _random = Random(seed);

  /// Generates a random color based on the provided seed.
  ///
  /// The generated color is in ARGB format, where:
  /// - A (Alpha) is set to 255 (fully opaque).
  /// - R (Red), G (Green), and B (Blue) are randomly generated values
  ///   between 0 and 255.
  Color generateColor() {
    const int alpha = maxColorValue; // Fully opaque
    final int red = _random.nextInt(maxColorValue + 1);
    final int green = _random.nextInt(maxColorValue + 1);
    final int blue = _random.nextInt(maxColorValue + 1);

    return Color.fromARGB(alpha, red, green, blue);
  }
}
