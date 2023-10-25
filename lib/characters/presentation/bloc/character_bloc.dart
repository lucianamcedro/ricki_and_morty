import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:estudo_rick_xp_flutter/characters/data/service/character_response.dart';
import 'package:estudo_rick_xp_flutter/characters/domain/character_interator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'character_event.dart';
part 'character_state.dart';

@injectable
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc(this._interator) : super(const CharacterState()) {
    on<CharacterRequestEvent>(_onCharacterRequestEvent);
  }
  final CharacterInterator _interator;

  Future<void> _onCharacterRequestEvent(
    CharacterRequestEvent event,
    Emitter<CharacterState> emit,
  ) async {
    if (state.hasReachedMax) {
      return;
    }
    emit(state.copyWith(result: ResultState.loading));

    try {
      final response = await _interator.fetchCharacters(state.page);

      emit(
        state.copyWith(
          page: state.page + 1,
          characters: List.of(state.characters)..addAll(response.results),
          hasReachedMax: state.page >= (response.info.pages ?? 1),
        ),
      );
    } catch (_) {
      emit(state.copyWith(result: ResultState.error));
    }
  }
}
