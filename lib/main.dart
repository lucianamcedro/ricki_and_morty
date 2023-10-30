import 'package:device_preview/device_preview.dart';
import 'package:estudo_rick_xp_flutter/detail/presentation/page/details_page.dart';
import 'package:estudo_rick_xp_flutter/home/presentation/page/home_page.dart';
import 'package:estudo_rick_xp_flutter/injection.dart';
import 'package:estudo_rick_xp_flutter/shared/theme/application_theme.dart';
import 'package:estudo_rick_xp_flutter/shared/theme/data/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    DevicePreview(
      builder: (_) {
        return const RickAndMortyApp();
      },
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => GetIt.I.get<ThemeCubit>(),
      child: const _App(),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'details/:id',
          name: 'details',
          builder: (context, state) => DetailsPage(
            characterId: state.pathParameters['id'] ?? '1',
          ),
        ),
      ],
    ),
  ],
);

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, String>(
      builder: (_, state) => MaterialApp.router(
        routerConfig: _router,
        theme: ApplicationTheme.byName(state)?.themeData,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
