import 'package:get_it/get_it.dart';
import 'package:ttrpgcharacter/features/character/data/repository/character_repository_impl.dart';
import 'package:ttrpgcharacter/features/character/data/sourcesource/local/character_local_datasource.dart';
import 'package:ttrpgcharacter/features/character/domain/usecases/create_character.dart';
import 'package:ttrpgcharacter/features/character/domain/usecases/get_characters.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character_bloc.dart';

var getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<CharacterLocalDatasource>(
    () => CharacterLocalDatasource(),
  );
  getIt.registerLazySingleton<CharacterRepositoryImpl>(
    () => CharacterRepositoryImpl(getIt<CharacterLocalDatasource>()),
  );
  getIt.registerLazySingleton<GetCharacters>(
    () => GetCharacters(getIt<CharacterRepositoryImpl>()),
  );
  getIt.registerLazySingleton<CreateCharacter>(
    () => CreateCharacter(getIt<CharacterRepositoryImpl>()),
  );
  getIt.registerFactory<CharacterBloc>(
    () => CharacterBloc(getIt<GetCharacters>()),
  );
}
