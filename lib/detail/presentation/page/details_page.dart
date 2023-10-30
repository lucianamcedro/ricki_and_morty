import 'package:estudo_rick_xp_flutter/detail/presentation/bloc/character_details_bloc.dart';
import 'package:estudo_rick_xp_flutter/detail/presentation/widgets/details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({required this.characterId, super.key});

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<CharacterDetailsBloc>()
        ..add(CharacterDetailsRequestEvent(characterId)),
      child: DetailsWidget(
        characterId: characterId,
      ),
    );
  }
}
