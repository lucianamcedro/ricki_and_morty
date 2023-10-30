import 'package:equatable/equatable.dart';

class CharacterDetailsLocationResponde extends Equatable {
  const CharacterDetailsLocationResponde({
    required this.name,
    required this.type,
    required this.dimension,
  });

  factory CharacterDetailsLocationResponde.fromJson(
    Map<String, dynamic> json,
  ) =>
      CharacterDetailsLocationResponde(
        name: json['name'],
        type: json['type'],
        dimension: json['dimension'],
      );

  final String name;
  final String type;
  final String dimension;

  @override
  List<Object?> get props => [name, type, dimension];
}
