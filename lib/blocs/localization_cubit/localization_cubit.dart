import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:random_color_generator/services/dependency_injection/dependency_injection.dart';

/// Manages the locale of the app.
@LazySingletonService()
class LocalizationCubit extends HydratedCubit<Language> {
  /// Creates a new [LocalizationCubit] with the given language.
  LocalizationCubit() : super(Language.english);

  /// Sets the language to the given [language].
  void setLanguage(Language language) => emit(language);

  /// Sets the language to the next language in the list of languages.
  void setNextLanguage() => emit(state.nextLanguage);

  @override
  Language? fromJson(Map<String, dynamic> json) =>
      Language.values.firstWhere((l) => l.code == json['language_code']);

  @override
  Map<String, dynamic>? toJson(Language state) => {'language_code': state.code};
}

/// Instances of this type represent a language in the supported languages set.
enum Language {
  /// The English language.
  english(isLTR: true, displayName: 'English', code: 'en'),

  /// The Ukrainian language.
  ukrainian(isLTR: true, displayName: 'Ukrainian', code: 'uk');

  const Language({
    required this.isLTR,
    required this.displayName,
    required this.code,
  });

  /// Whether the language is written from left to right.
  final bool isLTR;

  /// The display name of the language, can be displayed to the user.
  final String displayName;

  /// A unique code that represents the language.
  final String code;

  /// Returns the next language in the list of languages. This is done using
  /// round-robin fashion, i.e. it returns the next language in the list of
  /// languages, and if the current language is the last language in the list,
  /// it returns the first language in the list.
  Language get nextLanguage =>
      Language.values[(index + 1) % Language.values.length];
}
