import 'package:equatable/equatable.dart';
import 'package:estudo_rick_xp_flutter/detail/data/service/character_details_location_responde.dart';

class CharacterDetailsResponde extends Equatable {
  const CharacterDetailsResponde({
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.image,
    required this.gender,
    required this.locations,
  });

  factory CharacterDetailsResponde.fromJson(
    Map<String, dynamic> json,
  ) =>
      CharacterDetailsResponde(
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        image: json['image'],
        gender: json['gender'],
        locations: (json['locations'] as List<dynamic>)
            .map((e) => CharacterDetailsLocationResponde.fromJson(e))
            .toList(),
      );

  final String name;
  final String status;
  final String species;
  final String type;
  final String image;
  final String gender;
  final List<CharacterDetailsLocationResponde> locations;

  @override
  List<Object?> get props =>
      [name, status, species, type, image, gender, locations];
}
