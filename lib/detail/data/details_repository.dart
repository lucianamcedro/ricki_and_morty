import 'package:estudo_rick_xp_flutter/detail/data/service/character_details_responde.dart';
import 'package:estudo_rick_xp_flutter/detail/data/service/character_details_service.dart';
import 'package:injectable/injectable.dart';

abstract class DetailsRepository {
  Future<CharacterDetailsResponde> getCharacterDetails(String id);
}

@Injectable(as: DetailsRepository)
class DetailsRepositoryImpl implements DetailsRepository {
  const DetailsRepositoryImpl(this._service);

  final CharacterDetailsService _service;
  @override
  Future<CharacterDetailsResponde> getCharacterDetails(String id) =>
      _service.getCharacterDetails(id);
}
