import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';
import 'package:ttrpgcharacter/features/character/domain/model/character_modules_model.dart';

enum CharacterStatus { initial, loading, success, error }

class CharacterState {
  final CharacterStatus status;
  final CharacterModel? character;
  final CharacterModulesModel? modules;
  final String? errorMessage;

  const CharacterState._({
    required this.status,
    this.errorMessage,
    this.character,
    this.modules,
  });

  factory CharacterState.initial() =>
      CharacterState._(status: CharacterStatus.initial);

  CharacterState copyWith({
    CharacterStatus? status,
    CharacterModel? character,
    String? errorMessage,
    CharacterModulesModel? modules,
  }) {
    return CharacterState._(
      status: status ?? this.status,
      character: character ?? this.character,
      errorMessage: errorMessage ?? this.errorMessage,
      modules: modules ?? this.modules,
    );
  }
}
