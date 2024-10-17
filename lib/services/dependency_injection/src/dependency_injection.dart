import 'dart:async';
import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart' hide Environment;
import 'package:random_color_generator/services/dependency_injection/src/dependency_injection.config.dart';
import 'package:random_color_generator/services/dependency_injection/src/dependency_injection_instance_names.dart';
import 'package:random_color_generator/services/environments/environment.dart';

// Typedefs for injectable's annotations to hide the package from
// the application code, so that it can be replaced with another DI package
// if needed.
/// Annotation for classes that should be registered as services and available
/// via the dependency injection container.
typedef Service = Injectable;

/// Annotation for classes that should be registered as lazy singleton services
/// and available via the dependency injection container.
typedef LazySingletonService = LazySingleton;

/// Annotation for parameters that should be injected from the dependency
/// injection container using the given name.
typedef InjectedParam = Named;

/// Initializes the dependency container.
@InjectableInit(initializerName: r'$initInjectable', asExtension: false)
Future<void> _initInjectable(GetIt getIt, Environment environment) async =>
    $initInjectable(getIt, environment: environment.name);

/// The ServiceProvider class encapsulates the dependency injection logic
/// and provides access to the services that are registered in the container.
// ignore: prefer_match_file_name
class ServiceProvider {
  static final GetIt _getIt = GetIt.instance;

  static Completer<void>? _initializedCompleter;

  /// Initializes the dependency container.
  static Future<void> init({
    required Environment environment,
  }) async {
    if (_initializedCompleter == null) {
      _initializedCompleter = Completer<void>();
      unawaited(_init(environment: environment));
    }

    // ignore: avoid_non_null_assertion
    return _initializedCompleter!.future;
  }

  static Future<void> _init({
    required Environment environment,
  }) async {
    _getIt.registerLazySingleton<Environment>(() => environment);
    await _initInjectable(_getIt, environment);
    // ignore: avoid_non_null_assertion
    _initializedCompleter!.complete();
  }

  /// Retrieves a registered instance of type [T] from the dependency container.
  /// - [instanceName]: The name of the instance to retrieve.
  /// - [param1]: The first parameter to pass to the instance's constructor.
  /// - [param2]: The second parameter to pass to the instance's constructor.
  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) =>
      _getIt.get<T>(
        instanceName: instanceName,
        param1: param1,
        param2: param2,
      );
}

/// Used to manually register services in the dependency container that are not
/// registered otherwise by annotations.
@module
abstract class RegisterModule {
  /// Retrieves the initial background color from the environment.
  @Named(DependencyInjectionInstanceNames.initialBackgroundColor)
  Color get initialBackgroundColor =>
      ServiceProvider.get<Environment>().initialBackgroundColor;

  /// Retrieves the seed for the random number generator from the environment.
  @Named(DependencyInjectionInstanceNames.seed)
  int get seed => ServiceProvider.get<Environment>().seed;
}
