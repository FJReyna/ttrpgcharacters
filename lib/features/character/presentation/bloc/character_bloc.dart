import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';
import 'package:ttrpgcharacter/features/character/domain/usecases/get_characters.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character_event.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters _getCharacters;

  CharacterBloc(this._getCharacters) : super(CharacterState.initial()) {
    on<GetCharactersEvent>(_onGetCharactersEvent);
  }

  Future _onGetCharactersEvent(GetCharactersEvent event, Emitter emit) async {
    emit(state.copyWith(status: CharacterStatus.loading));
    try {
      final List<CharacterModel> characters = await _getCharacters.call();
      emit(
        state.copyWith(status: CharacterStatus.success, characters: characters),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CharacterStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
