import 'package:estudo_rick_xp_flutter/shared/extensions/string_extensions.dart';
import 'package:estudo_rick_xp_flutter/shared/theme/application_theme.dart';
import 'package:estudo_rick_xp_flutter/shared/theme/data/app_theme.dart';
import 'package:estudo_rick_xp_flutter/shared/theme/data/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, String>(
      builder: (context, state) {
        return ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 32.0,
                ),
                ...ApplicationTheme.themes.keys.map(
                  (model) => RadioListTile(
                    title: Text(model.title),
                    value: model,
                    groupValue: ApplicationTheme.byName(state)
                        ?.theme, // Use model.theme em vez de model
                    onChanged: (value) {
                      context.read<ThemeCubit>().changeTheme(
                            (value as AppTheme).title,
                          );
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'External links',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: const Divider(),
                ),
                ListTile(
                  title: const Text('Flutter dev'),
                  leading: const Icon(Icons.flutter_dash_outlined),
                  iconColor: Colors.blueAccent,
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                  onTap: () => 'flutter.dev'.launchInBrowse(),
                ),
                ListTile(
                  title: const Text('Android Developers Blog'),
                  leading: const Icon(Icons.android),
                  iconColor: Colors.greenAccent,
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                  onTap: () =>
                      'android-developers.googleblog.com'.launchInBrowse(),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
