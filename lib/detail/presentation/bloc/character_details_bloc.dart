import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:estudo_rick_xp_flutter/detail/data/details_repository.dart';
import 'package:estudo_rick_xp_flutter/detail/data/service/character_details_responde.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';

@injectable
class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  CharacterDetailsBloc(this._repository)
      : super(CharacterDetailsInitialState()) {
    on(_onRequestEvent);
  }
  final DetailsRepository _repository;

  Future<void> _onRequestEvent(
    CharacterDetailsRequestEvent event,
    Emitter<CharacterDetailsState> emit,
  ) async {
    try {
      emit(CharacterDetailsLoadingState());
      emit(
        CharacterDetailsResultState(
          await _repository.getCharacterDetails(event.id),
        ),
      );
    } catch (_) {
      emit(CharacterDetailsErrorState());
    }
  }
}
