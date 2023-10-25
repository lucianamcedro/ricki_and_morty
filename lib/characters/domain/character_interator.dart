import 'package:estudo_rick_xp_flutter/characters/data/service/service.dart';

abstract class CharacterInterator {
  Future<CharacterApiResponse> fetchCharacters(int page);
}
