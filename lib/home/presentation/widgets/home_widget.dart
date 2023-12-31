import 'package:estudo_rick_xp_flutter/characters/presentation/page/character_page.dart';
import 'package:estudo_rick_xp_flutter/home/presentation/cubit/navigation_cubit.dart';
import 'package:estudo_rick_xp_flutter/settings/presentation/page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});

  final _pages = {
    const CharacterPage(): const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Characters',
    ),
    const SettingsPage(): const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: _pages.keys.toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: _pages.values.toList(),
            currentIndex: state,
            onTap: (value) =>
                context.read<NavigationCubit>().onSelectTab(value),
          ),
        );
      },
    );
  }
}
