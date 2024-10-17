import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:random_color_generator/services/color_generator/color_generator.dart';
import 'package:random_color_generator/services/dependency_injection/dependency_injection.dart';
import 'package:random_color_generator/ui/screens/color_generator_screen/src/ui/color_generator_screen.dart';

/// Cubit for managing the state of the [ColorGeneratorScreen].
@LazySingletonService()
class ColorGeneratorScreenCubit extends HydratedCubit<Color> {
  final ColorGenerator _colorGenerator;

  /// Creates a [ColorGeneratorScreenCubit].
  ColorGeneratorScreenCubit(
    this._colorGenerator,
    @InjectedParam(DependencyInjectionInstanceNames.initialBackgroundColor)
    Color initialBackgroundColor,
  ) : super(initialBackgroundColor);

  /// Generates a random color and updates the state.
  void generateRandomColor() => emit(_colorGenerator.generateColor());

  @override
  Color? fromJson(Map<String, dynamic> json) => Color.fromARGB(
        json['alpha'] as int,
        json['red'] as int,
        json['green'] as int,
        json['blue'] as int,
      );

  @override
  Map<String, dynamic>? toJson(Color state) => {
        'alpha': state.alpha,
        'red': state.red,
        'green': state.green,
        'blue': state.blue,
      };
}
