// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i264;

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:random_color_generator/blocs/localization_cubit/localization_cubit.dart'
    as _i683;
import 'package:random_color_generator/services/color_generator/color_generator.dart'
    as _i6;
import 'package:random_color_generator/services/dependency_injection/src/dependency_injection.dart'
    as _i994;
import 'package:random_color_generator/ui/screens/color_generator_screen/src/cubit/color_generator_screen_cubit.dart'
    as _i171;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initInjectable(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i683.LocalizationCubit>(() => _i683.LocalizationCubit());
  gh.factory<int>(
    () => registerModule.seed,
    instanceName: 'seed',
  );
  gh.factory<_i264.Color>(
    () => registerModule.initialBackgroundColor,
    instanceName: 'initialBackgroundColor',
  );
  gh.factory<_i6.ColorGenerator>(
      () => _i6.ColorGenerator(seed: gh<int>(instanceName: 'seed')));
  gh.lazySingleton<_i171.ColorGeneratorScreenCubit>(
      () => _i171.ColorGeneratorScreenCubit(
            gh<_i6.ColorGenerator>(),
            gh<_i264.Color>(instanceName: 'initialBackgroundColor'),
          ));
  return getIt;
}

class _$RegisterModule extends _i994.RegisterModule {}
