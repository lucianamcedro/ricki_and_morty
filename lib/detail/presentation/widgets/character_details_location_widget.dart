import 'package:estudo_rick_xp_flutter/detail/data/service/character_details_location_responde.dart';
import 'package:flutter/material.dart';

class CharacterDetailsLocationWidget extends StatelessWidget {
  const CharacterDetailsLocationWidget({required this.location, super.key});

  final CharacterDetailsLocationResponde location;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: theme.cardTheme.elevation ?? 0.0,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              location.type,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 13),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              location.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              location.dimension,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
