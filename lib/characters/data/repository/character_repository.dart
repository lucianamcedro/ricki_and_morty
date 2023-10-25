import 'package:estudo_rick_xp_flutter/characters/data/service/service.dart';

abstract class CharacterRepository {
  Future<CharacterApiResponse> getCharacters(int page);
}
