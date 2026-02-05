import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';
import 'package:ttrpgcharacter/features/character/domain/usecases/get_characters.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/characters/characters_event.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/characters/characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharacters _getCharacters;

  CharactersBloc(this._getCharacters) : super(CharactersState.initial()) {
    on<GetCharactersEvent>(_onGetCharactersEvent);
  }

  Future _onGetCharactersEvent(GetCharactersEvent event, Emitter emit) async {
    emit(state.copyWith(status: CharactersStatus.loading));
    try {
      final List<CharacterModel> characters = await _getCharacters.call();
      emit(
        state.copyWith(
          status: CharactersStatus.success,
          characters: characters,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CharactersStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
