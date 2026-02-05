// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get charactersAppbarTitle => 'My Characters';

  @override
  String get charactersEmptyState => 'No characters found. Create your first character by tapping the + button.';

  @override
  String get charactersFailedState => 'Failed to load characters.';

  @override
  String get characterLoading => 'Loading Character';
}
