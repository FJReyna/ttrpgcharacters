abstract class CharacterEvent {}

class GetCharacterEvent extends CharacterEvent {
  final String id;

  GetCharacterEvent({required this.id});
}
