import 'dart:io';

import 'package:dio/dio.dart';
import 'package:estudo_rick_xp_flutter/characters/data/service/service.dart';
import 'package:injectable/injectable.dart';

abstract class CharacterService {
  Future<CharacterApiResponse> getCharacteres([int page = 1]);
}

@Injectable(as: CharacterService)
class CharacterServiceImp implements CharacterService {
  const CharacterServiceImp(this._client);

  final Dio _client;

  @override
  Future<CharacterApiResponse> getCharacteres([int page = 1]) async {
    final response = await _client.get(
      'character',
      queryParameters: {
        'page': '$page',
      },
    );

    await Future.delayed(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      return CharacterApiResponse.fromJson(response.data);
    }
    throw HttpException('Fail to get characters at page $page');
  }
}
