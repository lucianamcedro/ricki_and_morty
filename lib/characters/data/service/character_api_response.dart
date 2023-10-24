import 'package:equatable/equatable.dart';
import 'package:estudo_rick_xp_flutter/characters/data/service/service.dart';

class CharacterApiResponse extends Equatable {
  const CharacterApiResponse({
    required this.info,
    required this.results,
  });

  factory CharacterApiResponse.fromJson(Map<String, dynamic> json) {
    return CharacterApiResponse(
      info: CharacterInfoResponse.fromJson(json['info']),
      results: (json['results'] as List<dynamic>)
          .map(
            (result) =>
                CharacterResponse.fromJson(result as Map<String, dynamic>),
          )
          .toList(),
    );
  }
  final CharacterInfoResponse info;
  final List<CharacterResponse> results;

  @override
  List<Object?> get props => [info, results];
}
