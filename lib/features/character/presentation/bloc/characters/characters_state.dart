import 'package:ttrpgcharacter/features/character/domain/model/character_model.dart';

enum CharactersStatus { initial, loading, success, error }

class CharactersState {
  final CharactersStatus status;
  final List<CharacterModel> characters;
  final String? errorMessage;

  CharactersState._({
    required this.status,
    this.characters = const [],
    this.errorMessage,
  });

  factory CharactersState.initial() =>
      CharactersState._(status: CharactersStatus.initial);

  CharactersState copyWith({
    CharactersStatus? status,
    List<CharacterModel>? characters,
    String? errorMessage,
  }) {
    return CharactersState._(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
