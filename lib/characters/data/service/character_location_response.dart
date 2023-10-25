import 'package:equatable/equatable.dart';

class CharacterLocationResponse extends Equatable {
  const CharacterLocationResponse(this.name);

  factory CharacterLocationResponse.fromJson(Map<String, dynamic> json) =>
      CharacterLocationResponse(
        json['name'] as String,
      );
  final String name;

  @override
  List<Object> get props => [name];
}
