import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Extension providing useful l10n methods to the BuildContext.
// ignore: prefer_match_file_name
extension AppLocalizationsExtension on BuildContext {
  /// Returns the AppLocalizations corresponding to this context.
  AppLocalizations get appLocalizations => AppLocalizations.of(this);
}

/// Extension providing useful l10n methods to the nullable BuildContext.
extension AppLocalizationsNullableExtension on BuildContext? {
  /// Returns the nullable AppLocalizations corresponding to this context.
  AppLocalizations? get appLocalizations => this?.appLocalizations;
}
