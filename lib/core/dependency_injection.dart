import 'package:get_it/get_it.dart';
import 'package:ttrpgcharacter/features/character/data/repository/character_repository_impl.dart';
import 'package:ttrpgcharacter/features/character/data/sourcesource/local/hive_datasource.dart';
import 'package:ttrpgcharacter/features/character/domain/usecases/create_character.dart';
import 'package:ttrpgcharacter/features/character/domain/usecases/get_character.dart';
import 'package:ttrpgcharacter/features/character/domain/usecases/get_character_modules.dart';
import 'package:ttrpgcharacter/features/character/domain/usecases/get_characters.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character/character_bloc.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/characters/characters_bloc.dart';
import 'package:uuid/uuid.dart';

var getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<Uuid>(Uuid());

  final datasource = CharacterHiveDatasource();
  await datasource.init();
  await datasource.seedInitialData();

  getIt.registerSingleton<CharacterHiveDatasource>(datasource);
  getIt.registerLazySingleton<CharacterRepositoryImpl>(
    () => CharacterRepositoryImpl(getIt<CharacterHiveDatasource>()),
  );
  getIt.registerLazySingleton<GetCharacters>(
    () => GetCharacters(getIt<CharacterRepositoryImpl>()),
  );
  getIt.registerLazySingleton<CreateCharacter>(
    () => CreateCharacter(getIt<CharacterRepositoryImpl>()),
  );
  getIt.registerLazySingleton<GetCharacter>(
    () => GetCharacter(getIt<CharacterRepositoryImpl>()),
  );
  getIt.registerLazySingleton<GetCharacterModules>(
    () => GetCharacterModules(getIt<CharacterRepositoryImpl>()),
  );
  getIt.registerFactory<CharacterBloc>(
    () => CharacterBloc(getIt<GetCharacter>(), getIt<GetCharacterModules>()),
  );
  getIt.registerFactory<CharactersBloc>(
    () => CharactersBloc(getIt<GetCharacters>()),
  );
}
