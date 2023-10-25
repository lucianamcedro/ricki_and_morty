import 'package:estudo_rick_xp_flutter/characters/data/repository/character_repository.dart';
import 'package:estudo_rick_xp_flutter/characters/data/service/character_service.dart';
import 'package:estudo_rick_xp_flutter/characters/data/service/service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CharacterRepository)
class CharacterRepositoryImp implements CharacterRepository {
  CharacterRepositoryImp({required this.service});

  final CharacterService service;
  @override
  Future<CharacterApiResponse> getCharacters(int page) =>
      service.getCharacteres(page);
}
