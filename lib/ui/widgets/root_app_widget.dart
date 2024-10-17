import 'package:flutter/material.dart';
import 'package:random_color_generator/ui/screens/color_generator_screen/color_generator_screen.dart';

/// The root widget of the app.
class RootAppWidget extends StatelessWidget {
  /// Creates a [RootAppWidget].
  const RootAppWidget({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ColorGeneratorScreen(),
      );
}
