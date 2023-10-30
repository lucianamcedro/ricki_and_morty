import 'package:device_preview/device_preview.dart';
import 'package:estudo_rick_xp_flutter/home/presentation/page/home_page.dart';
import 'package:estudo_rick_xp_flutter/injection.dart';
import 'package:estudo_rick_xp_flutter/shared/theme/application_theme.dart';
import 'package:estudo_rick_xp_flutter/shared/theme/data/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Use FutureBuilder para aguardar a inicialização do GetIt
      future: configureDependencies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BlocBuilder<ThemeCubit, String>(
            builder: (_, state) => MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ApplicationTheme.byName(state)?.themeData,
              home: const HomePage(),
            ),
          );
        } else {
          return const CircularProgressIndicator(); // Adicione um indicador de carregamento, se necessário
        }
      },
    );
  }
}
