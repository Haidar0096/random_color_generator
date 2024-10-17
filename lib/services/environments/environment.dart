import 'package:flutter/material.dart';

/// The base class for all environments.
sealed class Environment {
  /// The name of the environment.
  final String name;

  /// The initial background color of the app.
  final Color initialBackgroundColor;

  /// The seed for the random color generator.
  final int seed;

  /// Creates an environment with the given name.
  const Environment({
    required this.name,
    required this.initialBackgroundColor,
    required this.seed,
  });
}

/// The development environment.
final class DevelopmentEnvironment extends Environment {
  /// Creates the development environment.
  const DevelopmentEnvironment()
      : super(
          name: 'development',
          initialBackgroundColor: Colors.red,
          seed: 42,
        );
}

/// The staging environment.
final class StagingEnvironment extends Environment {
  /// Creates the staging environment.
  const StagingEnvironment()
      : super(
          name: 'staging',
          initialBackgroundColor: Colors.green,
          seed: 43,
        );
}

/// The production environment.
final class ProductionEnvironment extends Environment {
  /// Creates the production environment.
  const ProductionEnvironment()
      : super(
          name: 'production',
          initialBackgroundColor: Colors.blue,
          seed: 44,
        );
}
