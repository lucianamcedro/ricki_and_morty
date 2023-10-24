import 'package:equatable/equatable.dart';

class CharacterInfoResponse extends Equatable {
  const CharacterInfoResponse(
    this.count,
    this.pages,
    this.next,
    this.prev,
  );

  factory CharacterInfoResponse.fromJson(Map<String, dynamic> json) =>
      CharacterInfoResponse(
        json['count'] as int?,
        json['pages'] as int?,
        json['next'] as String?,
        json['prev'] as String?,
      );
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  @override
  List<Object?> get props => [count, pages, next, prev];
}
