import 'package:estudo_rick_xp_flutter/characters/data/repository/character_repository.dart';
import 'package:estudo_rick_xp_flutter/characters/data/service/character_api_response.dart';
import 'package:estudo_rick_xp_flutter/characters/domain/character_interator.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CharacterInterator)
class CharacterInteratorImp implements CharacterInterator {
  CharacterInteratorImp({required this.repository});

  final CharacterRepository repository;

  @override
  Future<CharacterApiResponse> fetchCharacters(int page) =>
      repository.getCharacters(page);
}
