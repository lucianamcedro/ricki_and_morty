import 'package:equatable/equatable.dart';
import 'package:estudo_rick_xp_flutter/characters/data/service/character_location_response.dart';

class CharacterResponse extends Equatable {
  const CharacterResponse(
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.image,
    this.location,
  );

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      CharacterResponse(
        json['id'] as int,
        json['name'] as String,
        json['status'] as String,
        json['species'] as String,
        json['type'] as String,
        json['image'] as String,
        CharacterLocationResponse.fromJson(
          json['location'],
        ),
      );

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String image;
  final CharacterLocationResponse location;

  @override
  List<Object> get props => [id, name, status, species, type, image];
}
