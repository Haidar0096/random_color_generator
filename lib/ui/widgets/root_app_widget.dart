import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:random_color_generator/blocs/localization_cubit/localization_cubit.dart';
import 'package:random_color_generator/services/dependency_injection/dependency_injection.dart';
import 'package:random_color_generator/ui/screens/color_generator_screen/color_generator_screen.dart';

/// The root widget of the app.
class RootAppWidget extends StatelessWidget {
  /// Creates a [RootAppWidget].
  const RootAppWidget({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ServiceProvider.get<ColorGeneratorScreenCubit>(),
          ),
          BlocProvider(
            create: (_) => ServiceProvider.get<LocalizationCubit>(),
          ),
        ],
        child: Builder(
          builder: (_) => BlocBuilder<LocalizationCubit, Language>(
            builder: (_, language) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const ColorGeneratorScreen(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale.fromSubtags(languageCode: language.code),
            ),
          ),
        ),
      );
}
