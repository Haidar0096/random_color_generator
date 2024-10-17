import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_color_generator/services/dependency_injection/dependency_injection.dart';
import 'package:random_color_generator/services/environments/environments.dart';
import 'package:random_color_generator/ui/widgets/root_app_widget.dart';

/// The common main entry point for the application.
Future<void> mainCommon(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceProvider.init(environment: environment);

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  runApp(const RootAppWidget());
}
