import 'package:http/http.dart';

abstract class CharacterService {
  Future<void> getCharacteres([int page = 1]);
}

class CharacterServiceImp implements CharacterService {
  const CharacterServiceImp(this._client);

  final Client _client;

  @override
  Future<void> getCharacteres([int page = 1]) async {
    final response = await _client.get(Uri.https(
      'rickandmortyapi.com',
      '/api/character',
      {
        'page': '$page',
      },
    ));
    print('Response: ${response.body}');
    print('Status code: ${response.statusCode}');
  }
}
