import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';

enum CharacterStatus { initial, loading, success, error }

class CharacterState {
  final CharacterStatus status;
  final List<CharacterModel> characters;
  final String? errorMessage;

  CharacterState._({
    required this.status,
    this.characters = const [],
    this.errorMessage,
  });

  factory CharacterState.initial() =>
      CharacterState._(status: CharacterStatus.initial);

  CharacterState copyWith({
    CharacterStatus? status,
    List<CharacterModel>? characters,
    String? errorMessage,
  }) {
    return CharacterState._(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
