import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class CharacterService {
  Future<void> getCharacteres([int page = 1]);
}

@Injectable(as: CharacterService)
class CharacterServiceImp implements CharacterService {
  const CharacterServiceImp(this._client);

  final Dio _client;

  @override
  Future<void> getCharacteres([int page = 1]) async {
    final response = _client.get(
      'character',
      queryParameters: {
        'page': '$page',
      },
    );
  }
}
