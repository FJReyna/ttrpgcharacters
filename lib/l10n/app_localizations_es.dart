// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get charactersAppbarTitle => 'Mis Personajes';

  @override
  String get charactersEmptyState => 'No se encontraron personajes. Crea tu primer personaje tocando el botón +.';

  @override
  String get charactersFailedState => 'Error al cargar los personajes.';

  @override
  String get characterLoading => 'Cargando Personaje';

  @override
  String get charactersEmptySlot => 'Espacio disponible';

  @override
  String get charactersEmptySlotSubtitle => 'Crear un nuevo personaje';

  @override
  String get characterNoModules => 'No se encontraron módulos';

  @override
  String get characterNoModulesSubtitle => 'Agrega un nuevo módulo para comenzar.';
}
