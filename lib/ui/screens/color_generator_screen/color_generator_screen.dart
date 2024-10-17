import 'package:flutter/material.dart';
import 'package:random_color_generator/services/color_generator/color_generator.dart';

/// Screen that generates random background color when the user taps anywhere
/// on the screen.
class ColorGeneratorScreen extends StatefulWidget {
  /// Seed to be used for the random number generator.
  final int seed;

  /// Creates a [ColorGeneratorScreen].
  const ColorGeneratorScreen({
    super.key,
    this.seed = ColorGenerator.defaultSeed,
  });

  @override
  State<ColorGeneratorScreen> createState() => _ColorGeneratorScreenState();
}

class _ColorGeneratorScreenState extends State<ColorGeneratorScreen> {
  // ignore: avoid_late_keyword
  late final ColorGenerator _colorGenerator;

  // ignore: avoid_late_keyword
  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _colorGenerator = ColorGenerator(seed: widget.seed);
    _backgroundColor = _colorGenerator.generateColor();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () =>
            setState(() => _backgroundColor = _colorGenerator.generateColor()),
        child: ColoredBox(
          color: _backgroundColor,
          child: const Center(
            child: DefaultTextStyle(
              style: TextStyle(fontSize: 50),
              child: Text('Hello there'),
            ),
          ),
        ),
      );
}
