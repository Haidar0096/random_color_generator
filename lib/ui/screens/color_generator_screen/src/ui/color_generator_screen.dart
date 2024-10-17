import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color_generator/blocs/localization_cubit/localization_cubit.dart';
import 'package:random_color_generator/l10n/l10n.dart';
import 'package:random_color_generator/ui/screens/color_generator_screen/color_generator_screen.dart';

/// Screen that generates random background color when the user taps anywhere
/// on the screen.
class ColorGeneratorScreen extends StatelessWidget {
  /// Creates a [ColorGeneratorScreen].
  const ColorGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          context.read<ColorGeneratorScreenCubit>().generateRandomColor();
          context.read<LocalizationCubit>().setNextLanguage();
        },
        child: BlocBuilder<ColorGeneratorScreenCubit, Color>(
          builder: (context, color) => ColoredBox(
            color: color,
            child: Center(
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 50),
                child: Text(
                  context.appLocalizations.helloThere,
                ),
              ),
            ),
          ),
        ),
      );
}
