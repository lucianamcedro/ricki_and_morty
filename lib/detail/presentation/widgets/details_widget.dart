import 'package:estudo_rick_xp_flutter/detail/presentation/bloc/character_details_bloc.dart';
import 'package:estudo_rick_xp_flutter/detail/presentation/widgets/character_details_location_widget.dart';
import 'package:estudo_rick_xp_flutter/shared/datastructure/pair.dart';
import 'package:estudo_rick_xp_flutter/shared/widgets/default_loading_widget.dart';
import 'package:estudo_rick_xp_flutter/shared/widgets/default_try_again_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({required this.characterId, super.key});

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
      builder: (context, state) {
        return Stack(
          children: [
            if (state is CharacterDetailsErrorState) ...{
              DefaultTryAgainWidget(
                onPressed: () => _requestCharacterDetails(context),
              ),
            } else if (state is CharacterDetailsResultState) ...{
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        state.responde.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ...[
                      Pair('Name', state.responde.name),
                      Pair('Status', state.responde.status),
                      Pair('Species', state.responde.species),
                      Pair('Type', state.responde.type),
                    ].map(
                      (pair) => ListTile(
                        title: Text(pair.firts),
                        subtitle: Text(pair.second),
                      ),
                    ),
                    if (state.responde.locations.isNotEmpty) ...{
                      GridView.count(
                        crossAxisCount: state.responde.locations.length,
                        shrinkWrap: true,
                        children: state.responde.locations
                            .map(
                              (currentLocation) =>
                                  CharacterDetailsLocationWidget(
                                location: currentLocation,
                              ),
                            )
                            .toList(),
                      ),
                    },
                  ],
                ),
              ),
            } else ...{
              const DefaultLoadingWidget(),
            },
          ],
        );
      },
    );
  }

  void _requestCharacterDetails(BuildContext context) => context
      .read<CharacterDetailsBloc>()
      .add(CharacterDetailsRequestEvent(characterId));
}
