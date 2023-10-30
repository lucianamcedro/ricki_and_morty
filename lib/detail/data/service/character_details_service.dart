import 'package:dio/dio.dart';
import 'package:estudo_rick_xp_flutter/characters/data/repository/character_repository.dart';

import 'package:estudo_rick_xp_flutter/detail/data/service/character_details_responde.dart';
import 'package:injectable/injectable.dart';

abstract class CharacterDetailsService {
  Future<CharacterDetailsResponde> getCharacterDetails(String id);
}

@Injectable(as: CharacterDetailsService)
class CharacterDetailsServiceImpl implements CharacterDetailsService {
  CharacterDetailsServiceImpl(this._client);

  final Dio _client;

  @override
  Future<CharacterDetailsResponde> getCharacterDetails(String id) async {
    try {
      final character = await _client.get('/character/$id');
      final originUrl = character.data['origin']['url'];
      final locationUrl = character.data['location']['url'];

      final location = await Future.wait([
        if (originUrl != '') ...[
          _client.get(originUrl).then((value) => value.data),
        ],
        if (locationUrl != '') ...[
          _client.get(locationUrl).then((value) => value.data),
        ],
      ]);

      final json = character.data;
      json['locations'] = location;
      return CharacterDetailsResponde.fromJson(json);
    } catch (_) {
      throw Exception('Fail getting character details $id,');
    }
  }
}
