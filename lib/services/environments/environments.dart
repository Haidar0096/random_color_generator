import 'package:flutter/material.dart';

/// The base class for all environments.
// ignore: prefer_match_file_name
sealed class Environment {
  /// The name of the environment.
  final String name;

  /// The initial background color of the app.
  Color get initialBackgroundColor;

  /// The seed for the random color generator.
  int get seed;

  /// Creates an environment with the given name.
  const Environment(this.name);
}

/// The development environment.
final class DevelopmentEnvironment extends Environment {
  @override
  Color get initialBackgroundColor => Colors.red;

  @override
  int get seed => 42;

  /// Creates the development environment.
  const DevelopmentEnvironment() : super('development');
}

/// The staging environment.
final class StagingEnvironment extends Environment {
  @override
  Color get initialBackgroundColor => Colors.green;

  @override
  int get seed => 43;

  /// Creates the staging environment.
  const StagingEnvironment() : super('staging');
}

/// The production environment.
final class ProductionEnvironment extends Environment {
  @override
  Color get initialBackgroundColor => Colors.blue;

  @override
  int get seed => 44;

  /// Creates the production environment.
  const ProductionEnvironment() : super('production');
}
