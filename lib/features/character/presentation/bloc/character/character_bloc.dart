import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';
import 'package:ttrpgcharacter/features/character/domain/model/character_modules_model.dart';
import 'package:ttrpgcharacter/features/character/domain/usecases/get_character.dart';
import 'package:ttrpgcharacter/features/character/domain/usecases/get_character_modules.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character/character_event.dart';
import 'package:ttrpgcharacter/features/character/presentation/bloc/character/character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacter _getCharacter;
  final GetCharacterModules _getCharacterModules;

  CharacterBloc(this._getCharacter, this._getCharacterModules)
    : super(CharacterState.initial()) {
    on<GetCharacterEvent>(_onGetCharacterEvent);
  }

  Future _onGetCharacterEvent(GetCharacterEvent event, Emitter emit) async {
    emit(state.copyWith(status: CharacterStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final CharacterModel character = await _getCharacter.call(event.id);
      final CharacterModulesModel modules = await _getCharacterModules.call(
        event.id,
      );
      emit(
        state.copyWith(
          status: CharacterStatus.success,
          character: character,
          modules: modules,
        ),
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
