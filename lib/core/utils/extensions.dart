import 'package:flutter/widgets.dart';
import 'package:ttrpgcharacter/l10n/app_localizations.dart';

extension Translate on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this)!;
}
